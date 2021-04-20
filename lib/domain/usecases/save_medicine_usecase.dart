import 'package:medical_management_app/domain/entities/medicine.dart';
import 'package:medical_management_app/domain/repositories/medicine_repository.dart';

class SaveMedicineUseCase {
  SaveMedicineUseCase(this._repository);
  final MedicineRepository _repository;

  Future<int> saveMedicine(Medicine medicine) async {
    return await _repository.setMedicine(medicine);
  }
}
