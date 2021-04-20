import 'package:medical_management_app/domain/entities/box.dart';
import 'package:medical_management_app/domain/repositories/boxes_repository.dart';

class SaveBoxesUseCase {
  SaveBoxesUseCase(this._repository);
  final BoxesRepository _repository;

  Future<bool> setBoxes(List<Box> boxes) async {
    return await _repository.setBoxes(boxes);
  }
}
