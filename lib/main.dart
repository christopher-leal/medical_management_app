import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medical_management_app/app_theme_cubit.dart';
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
      child: BlocProvider(
        create: (context) => AppThemeCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          title: 'MedicalManagementApp',
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('es', 'ES'),
          ],
          home: SplashScreen(),
        ),
      ),
    );
  }
}
