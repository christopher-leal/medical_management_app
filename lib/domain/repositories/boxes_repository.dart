import 'package:medical_management_app/domain/entities/box.dart';

abstract class BoxesRepository {
  Future<List<Box>> getBoxesList();
  Future<bool> setBoxes(List<Box> boxes);
  Future<List<Box>> getBoxesById(int medicineId);
}
