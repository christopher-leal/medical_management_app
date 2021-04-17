import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        drawer: _CreateDrawer(),
        body: BlocBuilder<HomeCubit, int>(
          builder: (context, state) {
            return IndexedStack(
              index: state,
              children: [
                // MedicineListScreen(),
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
                // ListTile(
                //   title: Text(StringResources.logOut),
                //   onTap: () async {
                //     await context.read<AuthService>().logout();
                //     Utils.navigateToReplacement(context, LoginScreen());
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
