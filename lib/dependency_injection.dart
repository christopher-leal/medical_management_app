import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_management_app/domain/usecases/medicines_usecase.dart';

import 'config/utils/db_provider.dart';
import 'data/repositories/auth_service.dart';
import 'data/repositories/medicine_service.dart';
import 'domain/repositories/auth_firebase_repository.dart';
import 'domain/repositories/medicine_repository.dart';

List<RepositoryProvider<Object>> injectDependencies() => [
      // repositories
      RepositoryProvider<DBProvider>(create: (context) => DBProvider()),
      RepositoryProvider<AuthRepository>(create: (context) => AuthService(FirebaseAuth.instance, FirebaseFirestore.instance)),
      RepositoryProvider<MedicineRepository>(create: (context) => MedicineService(context.read())),
      // useCases
      RepositoryProvider<MedicinesUseCase>(create: (context) => MedicinesUseCase(context.read())),
    ];
