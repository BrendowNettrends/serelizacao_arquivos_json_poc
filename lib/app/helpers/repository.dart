import 'package:serelizacao_arquivos_json_poc/app/helpers/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  DatabaseHelper _databaseConnection;

  Repository() {

    _databaseConnection = DatabaseHelper();
  }

  static Database _database;

  Future<Database> get database async {
    if(_database != null) return _database;

    _database = await _databaseConnection.initializeDatabase();
    return _database;
  }


  Future<void> insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }


  Future<List<Map<String, dynamic>>> readData(table) async {
    var connection = await database;
    var response = await connection.query(table);
    return response;
  }

  Future<List<Map<String, dynamic>>> readDataById(table, columnId,id) async {
    var connection = await database;
    return await connection.rawQuery(''
        'SELECT * FROM $table WHERE $columnId = $id');
  }

  Future<List<Map<String, dynamic>>> readDataByIdQuery(table, columnId,id) async {
    var connection = await database;
    return await connection.query(table, where: "$columnId=?", whereArgs: ['$id']);
  }


  Future updateData(table, data, column,dataId) async {
    var connection = await database;
    return await connection
        .update(table, data, where: '$column=?', whereArgs: [dataId]);
  }

  Future deleteData(table, itemId) async {
    var connection = await database;
    return await connection.rawDelete('DELETE FROM $table WHERE id = $itemId');
  }
}