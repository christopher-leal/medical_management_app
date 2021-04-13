import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_management_app/data/repositories/auth_service.dart';
import 'package:medical_management_app/domain/repositories/auth_firebase_repository.dart';
import 'package:medical_management_app/presentation/pages/splash/splash_cubit.dart';
import 'package:medical_management_app/presentation/pages/splash/splash_screen.dart';

import 'config/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (context) => AuthService(context.read(), context.read())),
        RepositoryProvider<SplashCubit>(create: (context) => SplashCubit(context.read())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        title: 'MedicalManagementApp',
        home: SplashScreen(),
      ),
    );
  }
}
