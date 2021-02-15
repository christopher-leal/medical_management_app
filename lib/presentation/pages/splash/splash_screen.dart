import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_management_app/presentation/pages/home/home_screen.dart';
import 'package:medical_management_app/presentation/pages/login/login_screen.dart';
import 'package:medical_management_app/utils/utils.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _checkAuth();
    });
    super.initState();
  }

  void _checkAuth() {
    final user = context.read<User>();
    if (user != null) {
      return Utils.navigateToReplacement(context, HomeScreen());
    }
    return Utils.navigateToReplacement(context, LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Text('Splash screen'),
      ),
    ));
  }
}
