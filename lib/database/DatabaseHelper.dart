import 'package:flutter_app/utils/Constants.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/models/Note.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;
  String noteTable = Constants.table;
  String colId = Constants.table;
  String colTitle = Constants.title;
  String colDescription = Constants.description;
  String colDate = Constants.date;
  String colPriority = Constants.priority;

  DatabaseHelper.createInstance();

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper.createInstance();
    return _databaseHelper!!;
  }

  Future<Database> initialisedDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "note.db";
    var notesDatabase =
        openDatabase(path, version: 1, onCreate: _createDatabase);
    return notesDatabase;
  }

  Future<Database> get database async {
    if (database == null) {
      _database = await initialisedDatabase();
    }
    return _database!!;
  }

  void _createDatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,"
        "$colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)");
  }

  //Fetch Operation
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;
    var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }

  //Insert Operation
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  //Update Operation
  Future<int> updateNote(Note note) async {
    var db = await this.database;
    var result = await db.update(noteTable, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

//Delete Operation
  Future<int> deleteNote(int id) async {
    var db = await this.database;
    var result =
        await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

  //Search Operation

  Future<int> getCounts() async {
    var db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery("SELECT COUNT (*) from $noteTable");
    int? result = Sqflite.firstIntValue(x);
    return result!!;
  }


  //Get all notes from hasbmapList from the database sqFlite
  Future<List<Note>> getNoteList() async {
    var noteMapList = await getNoteMapList();
    int count = noteMapList.length;
    List<Note> noteList = <Note>[];
    for (int i = 0; i < count; i++) {
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }
    return noteList;
  }
}
