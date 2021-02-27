import 'package:flutter_todo_sqlite/repositories/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  DatabaseConnection _databaseConnection;

  Repository() {
    // 初始化資料庫連線
    _databaseConnection = DatabaseConnection();
  }

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  // 新增資料至表格
  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }
}
