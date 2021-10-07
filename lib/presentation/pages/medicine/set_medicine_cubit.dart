import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_management_app/config/utils/utils.dart';
import 'package:medical_management_app/domain/entities/box.dart';
import 'package:medical_management_app/domain/entities/medicine.dart';
import 'package:medical_management_app/domain/usecases/get_boxes_usecase.dart';
import 'package:medical_management_app/domain/usecases/save_boxes_usecase.dart';
import 'package:medical_management_app/domain/usecases/save_medicine_usecase.dart';

class NewMedicineState {
  NewMedicineState(this.boxes, this.medicine, {this.error, this.isLoading = false, this.isSuccess = false});
  final List<Box> boxes;
  final Medicine? medicine;
  final String? error;
  final bool isLoading;
  final bool isSuccess;
}

class NewMedicineCubit extends Cubit<NewMedicineState> {
  NewMedicineCubit(this._boxesUseCase, this._medicineUseCase, this._getBoxesUseCase) : super(NewMedicineState([Box()], null));
  final SaveMedicineUseCase _medicineUseCase;
  final SaveBoxesUseCase _boxesUseCase;
  final GetBoxesUseCase _getBoxesUseCase;
  final medicineNameController = TextEditingController();
  void addBox() {
    state.boxes.add(Box());
    emit(NewMedicineState([...state.boxes], state.medicine));
  }

  void removeBox(int index) {
    state.boxes.removeAt(index);
    emit(NewMedicineState([...state.boxes], state.medicine));
  }

  Future<void> saveMedicine() async {
    if (medicineNameController.text.trim().isEmpty) {
      print('name vacio');
      emit(NewMedicineState([...state.boxes], state.medicine, error: 'El nombre del medicamento es requerido'));
      return;
    }
    for (final item in state.boxes) {
      if (item.amountController.text.trim().isEmpty || item.expirationDate == null) {
        print('vacio');
        emit(NewMedicineState([...state.boxes], state.medicine, error: 'Los campos de la caja son requeridos'));
        return;
      }
    }
    emit(NewMedicineState([...state.boxes], state.medicine, isLoading: true));
    final medicine = state.medicine != null
        ? Medicine(id: state.medicine!.id, name: medicineNameController.text.trim(), updatedAt: DateTime.now().toString())
        : Medicine(name: medicineNameController.text.trim(), updatedAt: DateTime.now().toString());
    final medicineId = await _medicineUseCase.saveMedicine(medicine);
    final boxes = state.boxes
        .map((box) =>
            Box(id: box.id, amount: box.amount, expirationDate: box.expirationDate, medicineId: medicineId, updatedAt: DateTime.now().toString()))
        .toList();
    final saved = await _boxesUseCase.setBoxes(boxes);
    if (saved) {
      emit(NewMedicineState([], state.medicine, isSuccess: true));
      return;
    }
    emit(NewMedicineState([...state.boxes], state.medicine, error: 'Ha ocurrido un error, intente de nuevo'));
  }

  Future<void> init(Medicine? medicine) async {
    if (medicine != null) {
      emit(NewMedicineState([], null, isLoading: true));
      medicineNameController.text = medicine.name!;
      final boxes = await _getBoxesUseCase.getBoxes(medicine.id);
      for (var item in boxes) {
        item.amountController.text = item.amount.toString();
        item.dateController.text = Utils.formatDateNumbers(string: item.expirationDate);
      }
      emit(NewMedicineState(boxes, medicine));
    }
  }
}
