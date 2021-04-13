import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_management_app/data/repositories/auth_service.dart';
import 'package:medical_management_app/presentation/pages/login/login_screen.dart';
import 'package:medical_management_app/config/resources/resources.dart';
import 'package:medical_management_app/config/utils/utils.dart';
import 'package:medical_management_app/presentation/pages/medicine/medicine_list.dart';
import 'package:provider/provider.dart';

import 'home_cubit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        // drawer: _CreateDrawer(),
        body: BlocBuilder<HomeCubit, int>(
          builder: (context, state) {
            return IndexedStack(
              index: state,
              children: [
                MedicineListScreen(),
              ],
            );
          },
        ),
      ),
    );
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
                    await context.read<AuthService>().logout();
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
