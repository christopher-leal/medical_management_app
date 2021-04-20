import 'package:medical_management_app/domain/entities/medicine.dart';

abstract class MedicineRepository {
  Future<List<Medicine>> getMedicineList();
  Future<int> setMedicine(Medicine medicine);
}
