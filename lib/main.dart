import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medical_management_app/domain/bloc/auth_bloc.dart';
import 'package:medical_management_app/presentation/pages/splash/splash_screen.dart';
import 'package:medical_management_app/resources/resources.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _border = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(Sizes.radius12),
      borderSide: BorderSide(color: MedicalManagementColors.accent),
    );
    final lightTheme = ThemeData(
        primaryColor: MedicalManagementColors.primary,
        accentColor: MedicalManagementColors.accent,
        textTheme: TextTheme().apply(displayColor: MedicalManagementColors.primary, bodyColor: MedicalManagementColors.primary),
        textSelectionColor: MedicalManagementColors.primary,
        cursorColor: MedicalManagementColors.primary,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: Sizes.padding),
          labelStyle: TextStyle(color: MedicalManagementColors.primaryText, fontWeight: FontWeight.bold),
          border: _border,
          enabledBorder: _border,
          focusedBorder: _border,
        ),
        buttonTheme: ButtonThemeData(
          shape: StadiumBorder(),
          minWidth: double.infinity,
          padding: EdgeInsets.all(Sizes.padding),
          buttonColor: MedicalManagementColors.accent,
          textTheme: ButtonTextTheme.primary,
        ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthBloc(FirebaseAuth.instance)),
        StreamProvider(create: (context) => context.read<AuthBloc>().authStateChanges),
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
