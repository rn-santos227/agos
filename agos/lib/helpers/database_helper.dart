import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "local.db";
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT NOT NULL,
        password TEXT NOT NULL,
        name TEXT NOT NULL,
        contact TEXT NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE forms (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ref_code TEXT NOT NULL,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        link TEXT NOT NULL,
        participants INTEGER NULL,
        deadline TEXT NULL,
        privacy INTEGER NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE questions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ref_code TEXT NOT NULL,
        form_id INTEGER NOT NULL,
        text INTEGER NOT NULL,
        type INTEGER NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE options (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ref_code TEXT NOT NULL,
        question_id INTEGER NOT NULL,
        text TEXT NULL,
        type INTEGER NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE responses (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        ref_code TEXT NOT NULL,
        form_id INTEGER NOT NULL,
        date TEXT NOT NULL,
        email TEXT NULL,
        asnwer TEXT NOT NULL
      );
    ''');
    
  }

  Future<List<Map<String, dynamic>>> search(table, query, arguments) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query(
      table,
      where: query, 
      whereArgs: arguments
    );
    return result;
  }

  Future<List<Map<String, dynamic>>> all(table) async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int?> count(table) async {
    Database db = await instance.database;
    var x = await db.rawQuery("SELECT COUNT (*) from $table");
    int? count = Sqflite.firstIntValue(x);
    return count;
  }

  Future<int> insert(table, Map<String, dynamic> row) async{
    Database db = await instance.database;
    return await db.insert(table, row, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}