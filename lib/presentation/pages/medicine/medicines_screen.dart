import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_management_app/presentation/pages/medicine/medicine_cubit.dart';

class MedicinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Medicinas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: BlocProvider(
        create: (context) => MedicineCubit(context.read())..getMedicines(),
        child: BlocBuilder<MedicineCubit, MedicinesState>(
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
