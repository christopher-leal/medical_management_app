import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_management_app/domain/repositories/medicine_repository.dart';

class MedicineCubit extends Cubit<List> {
  MedicineCubit(this._medicineRepository) : super([]);
  final MedicineRepository _medicineRepository;

  Future<void> getMedicines() async {
    await _medicineRepository.getMedicineList();
  }
}
