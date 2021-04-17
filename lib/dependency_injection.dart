import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/utils/db.dart';
import 'data/repositories/auth_service.dart';
import 'data/repositories/medicine_service.dart';
import 'domain/repositories/auth_firebase_repository.dart';
import 'domain/repositories/medicine_repository.dart';

List<RepositoryProvider<Object>> injectDependencies() => [
      RepositoryProvider<DbHelper>(create: (context) => DbHelper()),
      RepositoryProvider<AuthRepository>(create: (context) => AuthService(FirebaseAuth.instance, FirebaseFirestore.instance)),
      RepositoryProvider<MedicineRepository>(create: (context) => MedicineService(context.read())),
    ];
