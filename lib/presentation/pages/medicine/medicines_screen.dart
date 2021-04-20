import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_management_app/config/utils/utils.dart';
import 'package:medical_management_app/presentation/pages/medicine/medicine_cubit.dart';
import 'package:medical_management_app/presentation/pages/medicine/new_medicine_screen.dart';

class MedicinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicineCubit(context.read())..getMedicines(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Medicinas'),
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () async {
                final isSuccess = (await Utils.navigateTo(context, NewMedicineScreen()) ?? false) as bool;
                if (isSuccess) {
                  context.read<MedicineCubit>().getMedicines();
                }
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            );
          },
        ),
        body: BlocBuilder<MedicineCubit, MedicinesState>(
          builder: (context, state) {
            if (state.isLoading) return const Center(child: CircularProgressIndicator());
            return ListView.builder(
              itemCount: state.medicines.length,
              itemBuilder: (BuildContext context, int index) {
                final medicine = state.medicines[index];
                return ListTile(
                  title: Text(medicine.name),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
