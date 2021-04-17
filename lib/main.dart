import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_management_app/data/repositories/auth_service.dart';
import 'package:medical_management_app/config/utils/db.dart';
import 'package:medical_management_app/data/repositories/medicine_service.dart';
import 'package:medical_management_app/domain/repositories/auth_firebase_repository.dart';
import 'package:medical_management_app/domain/repositories/medicine_repository.dart';
import 'package:medical_management_app/presentation/pages/home/home_cubit.dart';
import 'package:medical_management_app/presentation/pages/medicine/medicine_cubit.dart';
import 'package:medical_management_app/presentation/pages/splash/splash_cubit.dart';
import 'package:medical_management_app/presentation/pages/splash/splash_screen.dart';

import 'config/theme/theme.dart';
import 'dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: injectDependencies(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        title: 'MedicalManagementApp',
        home: SplashScreen(),
      ),
    );
  }
}
