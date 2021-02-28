import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_todolist_sqflite1');
    var database = await openDatabase(path,
        version: 1, onCreate: _onCreatingDatabase, onUpgrade: _onUpgrade);

    return database;
  }

  _onCreatingDatabase(Database database, int version) async {
    await database.execute(
        "CREATE TABLE categories(id INTEGER PRIMARY KEY, name TEXT, description TEXT)");

    // 產生Todo表格
    await database.execute(
        "CREATE TABLE todos(id INTEGER PRIMARY KEY, title TEXT, description TEXT, category TEXT, todoDate TEXT, isFinished INTEGER)");
  }

  // 更新表格
  void _onUpgrade(Database database, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      // 可執行修改表格SQL語法
    }
  }
}
