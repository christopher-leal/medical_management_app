import 'package:medical_management_app/domain/entities/medicine.dart';
import 'package:medical_management_app/domain/repositories/medicine_repository.dart';

class MedicinesUseCase {
  const MedicinesUseCase(this._repository);
  final MedicineRepository _repository;

  Future<List<Medicine>> getMedicines() async {
    return await _repository.getMedicineList();
  }
}
