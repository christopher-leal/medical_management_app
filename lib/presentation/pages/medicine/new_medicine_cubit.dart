import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_management_app/domain/entities/box.dart';
import 'package:medical_management_app/domain/entities/medicine.dart';
import 'package:medical_management_app/domain/usecases/save_boxes_usecase.dart';
import 'package:medical_management_app/domain/usecases/save_medicine_usecase.dart';

class NewMedicineState {
  NewMedicineState(this.boxes, {this.error, this.isLoading = false, this.isSuccess = false});
  final List<Box> boxes;
  final String error;
  final bool isLoading;
  final bool isSuccess;
}

class NewMedicineCubit extends Cubit<NewMedicineState> {
  NewMedicineCubit(this._boxesUseCase, this._medicineUseCase) : super(NewMedicineState([Box()]));
  final SaveMedicineUseCase _medicineUseCase;
  final SaveBoxesUseCase _boxesUseCase;
  final medicineNameController = TextEditingController();
  void addBox() {
    state.boxes.add(Box());
    emit(NewMedicineState([...state.boxes]));
  }

  void removeBox(int index) {
    state.boxes.removeAt(index);
    emit(NewMedicineState([...state.boxes]));
  }

  Future<void> saveMedicine() async {
    if (medicineNameController.text.trim().isEmpty) {
      print('name vacio');
      emit(NewMedicineState([...state.boxes], error: 'El nombre del medicamento es requerido'));
      return;
    }
    for (final item in state.boxes) {
      if (item.amountController.text.trim().isEmpty || item.expirationDate == null) {
        print('vacio');
        emit(NewMedicineState([...state.boxes], error: 'Los campos de la caja son requeridos'));
        return;
      }
    }
    emit(NewMedicineState([...state.boxes], isLoading: true));

    final medicineId = await _medicineUseCase.saveMedicine(Medicine(name: medicineNameController.text.trim()));
    final boxes = state.boxes
        .map((box) => Box(amount: double.parse(box.amountController.text.trim()), expirationDate: box.expirationDate, medicineId: medicineId))
        .toList();
    final saved = await _boxesUseCase.setBoxes(boxes);
    if (saved) {
      emit(NewMedicineState([], isSuccess: true));
      return;
    }
    emit(NewMedicineState([...state.boxes], error: 'Ha ocurrido un error, intente de nuevo'));
  }
}
