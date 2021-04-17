import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
