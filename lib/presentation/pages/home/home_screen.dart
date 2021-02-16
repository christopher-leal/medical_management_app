import 'package:flutter/material.dart';
import 'package:medical_management_app/domain/bloc/auth_bloc.dart';
import 'package:medical_management_app/presentation/pages/login/login_screen.dart';
import 'package:medical_management_app/resources/resources.dart';
import 'package:medical_management_app/utils/utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        drawer: _CreateDrawer(),
        body: Container(
          child: Center(
            child: Text('Home screen'),
          ),
        ));
  }
}

class _CreateDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Container(),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text(StringResources.logOut),
                  onTap: () async {
                    await context.read<AuthBloc>().logout();
                    Utils.navigateToReplacement(context, LoginScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
