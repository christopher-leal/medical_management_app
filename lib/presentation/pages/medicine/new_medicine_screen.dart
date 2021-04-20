import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:medical_management_app/config/utils/utils.dart';
import 'package:medical_management_app/domain/entities/medicine.dart';

import 'new_medicine_cubit.dart';

class NewMedicineScreen extends StatelessWidget {
  NewMedicineScreen({Key key, this.medicine}) : super(key: key);
  final Medicine medicine;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewMedicineCubit(context.read(), context.read(), context.read())..init(medicine),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: medicine != null ? const Text('Editar medicina') : const Text('Nueva medicina'),
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: context.read<NewMedicineCubit>().saveMedicine,
              child: const Icon(
                Icons.save,
                color: Colors.white,
              ),
            );
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: BlocConsumer<NewMedicineCubit, NewMedicineState>(
            listener: (context, state) {
              if (state.error != null) {
                Utils.showSnackBar(_scaffoldKey, context, state.error);
                return;
              }
              if (state.isSuccess) {
                Navigator.pop(context, true);
                return;
              }
            },
            builder: (context, state) {
              if (state.isLoading) return const Center(child: CircularProgressIndicator());
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: context.read<NewMedicineCubit>().medicineNameController,
                    decoration: InputDecoration(labelText: 'Nombre del medicamento', hintText: 'Ingrese el nombre'),
                  ),
                  const SizedBox(height: 14),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cajas',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            context.read<NewMedicineCubit>().addBox();
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.boxes.length,
                      itemBuilder: (context, index) {
                        final box = state.boxes[index];
                        return Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: box.amountController,
                                decoration: InputDecoration(labelText: 'Cantidad', hintText: 'Ej: 1'),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  if (double.tryParse(value) != null) box.amount = double.parse(value);
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 3,
                              child: TextField(
                                decoration: InputDecoration(labelText: 'Expiración'),
                                keyboardType: TextInputType.datetime,
                                controller: box.dateController,
                                onTap: () {
                                  Utils.dismissKeyboard(context);
                                  DatePicker.showDatePicker(
                                    context,
                                    showTitleActions: true,
                                    locale: LocaleType.es,
                                    minTime: DateTime.now(),
                                    onConfirm: (date) {
                                      print('confirm ${Utils.dateWithoutTime(date)}');
                                      box.expirationDate = Utils.dateWithoutTime(date);
                                      box.dateController.text = Utils.formatDateNumbers(datetime: date);
                                    },
                                    currentTime: DateTime.now(),
                                  );
                                },
                              ),
                            ),
                            if (state.boxes.length > 1)
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  context.read<NewMedicineCubit>().removeBox(index);
                                },
                              )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
