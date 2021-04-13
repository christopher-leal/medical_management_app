import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String dbName = 'medical_management.db';
const String medicinesTableName = 'medicines';

class DbHelper {
  static final DbHelper _instance = DbHelper._();
  factory DbHelper() => _instance;
  DbHelper._();

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
      },
    );
  }
}
