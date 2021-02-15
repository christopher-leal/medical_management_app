import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_management_app/domain/bloc/auth_bloc.dart';
import 'package:medical_management_app/resources/resources.dart';
import 'package:medical_management_app/resources/sizes.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildForm(context),
    );
  }

  Widget _buildForm(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
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
                  decoration: InputDecoration(labelText: StringResources.email),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: StringResources.password,
                  ),
                ),
                SizedBox(height: Sizes.padding),
                RaisedButton(
                  child: Text(StringResources.logIn),
                  onPressed: () {},
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
                    await authBloc.signInWithGoogle();
                  },
                ),
                TextButton(
                  child: Text(StringResources.register),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
