import 'package:medical_management_app/domain/entities/box.dart';
import 'package:medical_management_app/domain/entities/medicine.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String dbName = 'medical_management.db';
const String medicinesTableName = 'medicines';
const String boxesTableName = 'boxes';

class DBProvider {
  static final DBProvider _instance = DBProvider._();
  factory DBProvider() => _instance;
  DBProvider._();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, dbName);
    print(path);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          create table $medicinesTableName ( 
            id integer primary key autoincrement, 
            name text not null,
            createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
            updatedAt TIMESTAMP   
            )
        ''');
        await db.execute('''
          create table $boxesTableName ( 
            id integer primary key autoincrement, 
            medicineId integer not null,           
            amount DECIMAL(10,2) not null,
            expirationDate TIMESTAMP,  
            createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
            updatedAt TIMESTAMP,
            constraint medicine_box foreign key (medicineId) references $medicinesTableName (id)
            )
        ''');
      },
    );
  }

  Future<int> setMedicine(Medicine medicine) async {
    final db = await database;
    if (medicine.id != null) {
      await db.update('$medicinesTableName', medicine.toJson(), where: 'id=?', whereArgs: [medicine.id]);
      return medicine.id;
    }
    return await db.insert('$medicinesTableName', medicine.toJson());
  }

  Future<Medicine> getMedicineById(int id) async {
    final db = await database;
    final res = await db.query('$medicinesTableName', where: 'id=?', whereArgs: [id]);
    return res.isNotEmpty ? Medicine.fromJson(res.first) : null;
  }

  Future<List<Medicine>> getMedicines() async {
    final db = await database;
    var res = await db.query('$medicinesTableName');
    final List<Medicine> medicines = res.isNotEmpty ? res.map((medicine) => Medicine.fromJson(medicine)).toList() : [];
    return medicines;
  }

  Future<int> deleteMedicine(int id) async {
    final db = await database;
    return await db.delete('$medicinesTableName', where: 'id=?', whereArgs: [id]);
  }

  Future<bool> setBoxes(List<Box> boxes) async {
    final saves = <int>[];
    for (final box in boxes) {
      saves.add(await _setBox(box));
    }
    return saves.length > 0;
  }

  Future<int> _setBox(Box box) async {
    final db = await database;

    if (box.id != null) {
      await db.update('$boxesTableName', box.toJson(), where: 'id=?', whereArgs: [box.id]);
      return box.id;
    }
    return await db.insert('$boxesTableName', box.toJson());
  }

  Future<List<Box>> getBoxes() async {
    final db = await database;
    var res = await db.query('$boxesTableName');
    final List<Box> boxes = res.isNotEmpty ? res.map((box) => Box.fromJson(box)).toList() : [];
    return boxes;
  }

  Future<List<Box>> getBoxesById(int medicineId) async {
    final db = await database;
    var res = await db.query('$boxesTableName', where: 'medicineId=?', whereArgs: [medicineId]);
    final List<Box> boxes = res.isNotEmpty ? res.map((box) => Box.fromJson(box)).toList() : [];
    return boxes;
  }

  Future<int> deleteBox(int id) async {
    final db = await database;
    return await db.delete('$boxesTableName', where: 'id=?', whereArgs: [id]);
  }
}
