import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "local.db";
  static final _databaseVersion = 1;

  static final _tableUsers = "users";
  static final _colID = "id";
  static final _colEmail = "email";
  static final _colPassword = "password";
  static final _colContact = "contact";

  static final _tableForms = "forms";
  static final _colTitle = "title";
  static final _colLink = "link";
  static final _colParticipants = "participants";
  static final _colPrivacy = "privacy";

  static final _tableQuestion = "questions";
  static final _colFormID= "form_id";
  static final _colType = "type";

  static final _tableAnswers = "answers";
  static final _colQuestionID = "question_id";
  static final _colAnswer = "answer";

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
      CREATE TABLE $_tableUsers (
        $_colID INTEGER PRIMARY KEY,
        $_colEmail TEXT NOT NULL,
        $_colPassword TEXT NOT NULL,
        $_colContact TEXT NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE $_tableForms (
        $_colID INTEGER PRIMARY KEY,
        $_colFormID TEXT NOT NULL,
        $_colTitle TEXT NOT NULL,
        $_colLink TEXT NOT NULL,
        $_colParticipants INTEGER NOT NULL,
        $_colPrivacy INTEGER NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE $_tableQuestion (
        $_colID INTEGER PRIMARY KEY,
        $_colTitle INTEGER NOT NULL,
        $_colType INTEGER NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE $_tableAnswers (
        $_colID INTEGER PRIMARY KEY,
        $_colQuestionID INTEGER NOT NULL,
        $_colType INTEGER NOT NULL,
        $_colAnswer TEXT NULL
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