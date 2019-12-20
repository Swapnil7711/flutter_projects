import 'package:sqflite/sqflite.dart';
import 'note.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // singleton
  static Database _database; // singleton

  // database column names and table name

  String noteTable = 'note_table';
  String colID = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colDate = 'date';
  String colPriority = 'priority';

  // create databse instance
  DatabaseHelper._createInstance();

  // check if database helper is aleardy present if yes then return else just create new one
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  // now intialze database by creating getter method for it

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

// open the database
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();

    String path = directory.path + 'notes.db';

    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);

    return notesDatabase;
  }

// create table while opening the database
  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $noteTable($colID INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDescription, $colPriority INTEGER, $colDate TEXT)');
  }

  Future<List<Map<String, dynamic>>> getNoteListMap() async {
    Database db = await this.database;

    var result = db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }

  Future<int> insertNote(Note note) async {
    Database db = await this.database;

    var result = db.insert(noteTable, note.toMap());

    return result;
  }

  Future<int> updateNote(Note note) async {
    Database db = await this.database;

    var result = db.update(noteTable, note.toMap(),
        where: '$colID = ?', whereArgs: [note.id]);

    return result;
  }

  Future<int> deleteNote(int id) async {
    Database db = await this.database;
    var result = db.rawDelete('DELETE FROM $noteTable where $colID = $id');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
        await db.rawQuery('select count(*) from $noteTable');

    int count = Sqflite.firstIntValue(x);

    return count;
  }

  Future<List<Note>> getNoteList() async {
    var noteMpaList = await getNoteListMap();

    // int count = noteMpaList.length;

    List<Note> noteList = List<Note>();

    for (var note in noteMpaList) {
      noteList.add(Note.fromMapObject(note));
    }

    return noteList;
  }
}
