import 'package:flutter/material.dart';
import 'package:medical_management_app/presentation/pages/splash/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedicalManagementApp',
      home: SplashScreen(),
    );
  }
}
