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

  // 從表格讀取資料
  readData(table) async {
    var connection = await database;
    return await connection.query(table);
  }

  // 使用Id從表格讀取資料
  readDataById(table, int itemId) async {
    var connection = await database;
    return await connection.query(
      table,
      where: 'id=?',
      whereArgs: [itemId],
    );
  }

  // 更新資料
  updateData(table, data) async {
    var connection = await database;
    return await connection.update(
      table,
      data,
      where: 'id=?',
      whereArgs: [data['id']],
    );
  }

  // 使用Id刪除資料
  deleteData(table, int itemId) async {
    var connection = await database;
    return await connection.rawDelete("DELETE FROM $table WHERE id = $itemId");
  }

  // 使用表格欄位名讀取資料
  readDataByColumnName(table, columnName, columnValue) async {
    var connection = await database;
    return await connection.query(
      table,
      where: "$columnName=?",
      whereArgs: [columnValue],
    );
  }
}
