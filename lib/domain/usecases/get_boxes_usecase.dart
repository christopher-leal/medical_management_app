import 'package:medical_management_app/domain/entities/box.dart';
import 'package:medical_management_app/domain/repositories/boxes_repository.dart';

class GetBoxesUseCase {
  GetBoxesUseCase(this._repository);
  final BoxesRepository _repository;

  Future<List<Box>> getBoxes(int? medicineId) async {
    return await _repository.getBoxesById(medicineId);
  }
}
