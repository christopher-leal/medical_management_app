import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medical_management_app/domain/bloc/auth_bloc.dart';
import 'package:medical_management_app/presentation/pages/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthBloc(FirebaseAuth.instance)),
        StreamProvider(create: (context) => context.read<AuthBloc>().authStateChanges),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MedicalManagementApp',
        home: SplashScreen(),
      ),
    );
  }
}
