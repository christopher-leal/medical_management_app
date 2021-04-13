import 'package:medical_management_app/config/utils/db.dart';
import 'package:medical_management_app/domain/repositories/medicine_repository.dart';

class MedicineService extends MedicineRepository {
  MedicineService(this._db);
  final DbHelper _db;

  @override
  Future getMedicineList() async {
    final db = await _db.database;
  }
}
