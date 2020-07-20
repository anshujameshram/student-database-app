import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  //private constructor
  DataBaseHelper._();

  //static reference for singleton class
  static final DataBaseHelper instance = DataBaseHelper._();

  static Database _db;

  Future<Database> get database async {
    if (_db != null) return _db;

    _db = await initDatabase();
    return _db;
  }

  Future<Database> initDatabase() async {
    String dataBasepath = await getDatabasesPath();
    String path = join(dataBasepath, 'students.db');

    Database db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
        'create table students(id integer primary key autoincrement,name text,branch text)');
  }
}
