import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_management_app/presentation/pages/login/signup_screen.dart';
import 'package:medical_management_app/config/resources/resources.dart';
import 'package:medical_management_app/config/resources/sizes.dart';
import 'package:medical_management_app/config/utils/utils.dart';

class LoginScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _buildForm(context),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Sizes.paddingXL),
        child: Column(
          children: [
            SizedBox(height: Sizes.paddingXL * 2),
            FlutterLogo(size: Sizes.iconSizeXL),
            SizedBox(height: Sizes.padding),
            Column(
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: StringResources.email),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: StringResources.password,
                  ),
                ),
                SizedBox(height: Sizes.padding),
                RaisedButton(
                  child: Text(
                    StringResources.logIn,
                    style: Theme.of(context).textTheme.button!.copyWith(fontSize: Sizes.textPrefix, color: MedicalManagementColors.white),
                  ),
                  onPressed: () async {
                    // if (_emailController.text.trim().isEmpty) return Utils.showSnackBar(_scaffoldKey, context, StringResources.emailRequired);
                    // if (_passwordController.text.trim().isEmpty) return Utils.showSnackBar(_scaffoldKey, context, StringResources.passwordRequired);
                    // final response = await authBloc.login(email: _emailController.text.trim(), password: _passwordController.text.trim());
                    // if (response) {
                    //   Utils.navigateToReplacement(context, HomeScreen());
                    // }
                    // Utils.showSnackBar(_scaffoldKey, context, StringResources.somethingWentWrong);
                  },
                ),
                // TextButton(
                //   child: Text('Contraseña olvidada'),
                //   onPressed: () {},
                // ),
              ],
            ),
            SizedBox(height: Sizes.paddingXL * 2),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                      SizedBox(width: Sizes.paddingS),
                      Text(StringResources.signInWighGoogle),
                    ],
                  ),
                  onPressed: () async {
                    // final response = await authBloc.signInWithGoogle();
                    // if (response) {
                    //   Utils.navigateToReplacement(context, HomeScreen());
                    // }
                    // Utils.showSnackBar(_scaffoldKey, context, StringResources.somethingWentWrong);
                  },
                ),
                TextButton(
                  child: Text(StringResources.register),
                  onPressed: () {
                    Utils.navigateTo(context, SignupScreen());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
