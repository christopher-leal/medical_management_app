import 'package:flutter/material.dart';
import 'package:medical_management_app/data/repositories/auth_service.dart';
import 'package:medical_management_app/presentation/pages/home/home_screen.dart';
import 'package:medical_management_app/config/resources/resources.dart';
import 'package:medical_management_app/config/utils/utils.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _nameController = TextEditingController();
  final _lastName1Controller = TextEditingController();
  final _lastName2Controller = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            StringResources.singUp,
            style: Theme.of(context).textTheme.headline6,
          ),
          // iconTheme: IconThemeData(color: Colors.red),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Sizes.paddingXL),
          child: Column(
            children: [
              // TextField(
              //   controller: _nameController,
              //   decoration: InputDecoration(labelText: StringResources.name),
              // ),
              // TextField(
              //   controller: _lastName1Controller,
              //   decoration: InputDecoration(labelText: StringResources.lastName1),
              // ),
              // TextField(
              //   controller: _lastName2Controller,
              //   decoration: InputDecoration(labelText: StringResources.lastName2),
              // ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: StringResources.email),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: StringResources.password),
                obscureText: true,
              ),
              TextField(
                controller: _repeatPasswordController,
                decoration: InputDecoration(labelText: StringResources.repeatPassword),
                obscureText: true,
              ),
              const SizedBox(height: Sizes.padding * 2.0),
              RaisedButton(
                child: Text(
                  StringResources.register,
                  style: Theme.of(context).textTheme.button!.copyWith(fontSize: Sizes.textPrefix, color: MedicalManagementColors.white),
                ),
                onPressed: () async {
                  if (_nameController.text.trim().isEmpty) return Utils.showSnackBar(_scaffoldKey, context, StringResources.nameRequired);
                  if (_lastName1Controller.text.trim().isEmpty) return Utils.showSnackBar(_scaffoldKey, context, StringResources.lastNameRequired);
                  if (_emailController.text.trim().isEmpty) return Utils.showSnackBar(_scaffoldKey, context, StringResources.emailRequired);
                  if (_passwordController.text.trim().isEmpty) return Utils.showSnackBar(_scaffoldKey, context, StringResources.passwordRequired);
                  if (_repeatPasswordController.text.trim().isEmpty)
                    return Utils.showSnackBar(_scaffoldKey, context, StringResources.repeatPasswordRequired);
                  if (_passwordController.text != _repeatPasswordController.text)
                    return Utils.showSnackBar(_scaffoldKey, context, StringResources.passwordsDoesntMatch);

                  final response =
                      await context.read<AuthService>().signup(email: _emailController.text.trim(), password: _passwordController.text.trim());
                  if (response) {
                    Utils.navigateToReplacement(context, HomeScreen());
                  }
                  Utils.showSnackBar(_scaffoldKey, context, StringResources.somethingWentWrong);
                },
              ),
              const SizedBox(height: Sizes.padding * 2.0),
              TextButton(onPressed: () {}, child: Text(StringResources.alreadyHaveAccount))
            ],
          ),
        ));
  }
}
