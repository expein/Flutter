import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{
  static const _databaseName = "Persona";
  static const _databaseVersion = 1;
  static const table = 'Personas';
  static const columnId = '_id';
  static const columnName = 'name';
  static const columnEmail = 'email';

 //-------------------------
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//--------------------------
  static Database? _database;
  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  //------------------------

  _initDatabase() async{
    var documentDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentDirectory.path, _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  //------------------------

  Future _onCreate(Database db, int version) async{
    await db.execute('''
        CREATE TABLE $table(
          $columnId INTEGER PRIMARY KEY,
          $columnName TEXT NOT NULL,
          $columnEmail TEXT NOT NULL
        )
    ''');
  }

  //------------------------

  Future<int> insert(Map<String, dynamic> row) async{
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> update(Map<String, dynamic> row) async{
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async{
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}