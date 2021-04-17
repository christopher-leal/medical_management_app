import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_management_app/domain/entities/medicine.dart';
import 'package:medical_management_app/domain/usecases/medicines_usecase.dart';

class MedicinesState {
  const MedicinesState(this.medicines, {this.isLoading = false});
  final List<Medicine> medicines;
  final bool isLoading;
}

class MedicineCubit extends Cubit<MedicinesState> {
  MedicineCubit(this._useCase) : super(MedicinesState([]));
  final MedicinesUseCase _useCase;

  Future<void> getMedicines() async {
    emit(MedicinesState(state.medicines, isLoading: true));
    final medicines = await _useCase.getMedicines();
    emit(MedicinesState([...state.medicines, ...medicines]));
  }
}
