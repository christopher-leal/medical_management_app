import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_management_app/presentation/pages/medicine/medicine_cubit.dart';

class MedicineListScreen extends StatelessWidget {
  // TODO: check services
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => MedicineCubit(context.read())..getMedicines(),
      child: BlocBuilder<MedicineCubit, List>(
        builder: (context, state) {
          print(state);
          return Container(
            child: Center(
              child: Text('Medicine screen'),
            ),
          );
        },
      ),
    ));
  }
}
