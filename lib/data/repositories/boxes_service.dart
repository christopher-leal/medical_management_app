import 'package:medical_management_app/config/utils/db_provider.dart';
import 'package:medical_management_app/domain/entities/box.dart';
import 'package:medical_management_app/domain/repositories/boxes_repository.dart';

class BoxesService extends BoxesRepository {
  BoxesService(this._dbProvider);
  final DBProvider _dbProvider;

  @override
  Future<List<Box>> getBoxesList() async {
    return await _dbProvider.getBoxes();
  }

  @override
  Future<bool> setBoxes(List<Box> boxes) async {
    return await _dbProvider.setBoxes(boxes);
  }
}
