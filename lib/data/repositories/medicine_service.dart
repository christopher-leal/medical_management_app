import 'package:medical_management_app/config/utils/db_provider.dart';
import 'package:medical_management_app/domain/entities/medicine.dart';
import 'package:medical_management_app/domain/repositories/medicine_repository.dart';

class MedicineService extends MedicineRepository {
  MedicineService(this._db);
  final DBProvider _db;

  @override
  Future<List<Medicine>> getMedicineList() async {
    return await _db.getMedicines();
  }
}
