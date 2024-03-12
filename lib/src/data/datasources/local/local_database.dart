import 'package:surah/src/data/models/audio_model_sql.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("audio.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = 'INT NOT NULL';

    await db.execute('''
    CREATE TABLE ${AudioModelSqlFields.tableName} (
    ${AudioModelSqlFields.id} $idType,
    ${AudioModelSqlFields.audio} $textType,
    ${AudioModelSqlFields.name} $textType,
    ${AudioModelSqlFields.author} $textType,
    ${AudioModelSqlFields.number} $intType,
    ${AudioModelSqlFields.description} $textType,
    ${AudioModelSqlFields.nameLat} $textType,
    ${AudioModelSqlFields.countAyah} $intType,
    ${AudioModelSqlFields.createLocation} $textType,
    )
    ''');

    debugPrint("-------DB----------CREATED---------");
  }




  static Future<QuranModelSql> insertSurah(
      QuranModelSql audioModel) async {
    final db = await getInstance.database;
    final int id = await db.insert(
        AudioModelSqlFields.tableName, audioModel.toJson());
    debugPrint('ID : $id');
    return audioModel.copyWith(id: id);
  }


  static Future<int> deleteAudio(int id) async {
    final db = await getInstance.database;
    int count = await db.delete(
      AudioModelSqlFields.tableName,
      where: "${AudioModelSqlFields.id} = ?",
      whereArgs: [id],
    );
    return count;
  }

  static Future<List<QuranModelSql>> getAllSurah() async {
    List<QuranModelSql> allProduct = [];
    final db = await getInstance.database;
    allProduct = (await db.query(AudioModelSqlFields.tableName))
        .map((e) => QuranModelSql.fromJson(e))
        .toList();
    return allProduct;
  }




  static Future<QuranModelSql?> getSingleSurah(String code) async {
    List<QuranModelSql> product = [];
    final db = await getInstance.database;
    product = (await db.query(
      AudioModelSqlFields.tableName,
      where: "${AudioModelSqlFields.id} = ?",
      whereArgs: [code],
    ))
        .map((e) => QuranModelSql.fromJson(e))
        .toList();

    if (product.isNotEmpty) {
      return product.first;
    }
  }


  static Future<void> deleteTable() async {
    Database database = await getInstance.database;
    await database.delete(AudioModelSqlFields.tableName);
  }


}