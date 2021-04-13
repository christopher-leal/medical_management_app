import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_management_app/presentation/pages/home/home_screen.dart';
import 'package:medical_management_app/presentation/pages/login/login_screen.dart';
import 'package:medical_management_app/presentation/pages/splash/splash_cubit.dart';
import 'package:medical_management_app/config/utils/utils.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(context.read())..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state == SplashState.logged_in) {
            return Utils.navigateToReplacement(context, HomeScreen());
          }
          return Utils.navigateToReplacement(context, LoginScreen());
        },
        child: Container(
          width: double.infinity,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
