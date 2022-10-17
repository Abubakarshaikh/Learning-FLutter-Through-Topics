import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'model/note.dart';

// Create Class
class NotesDatabase {
  // Create Global Field, Which is our Instance
  static final NotesDatabase instance = NotesDatabase._init();

  // Create New Filed
  static Database? _database;

  // Create Named Private Constructor
  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filePath);

    return openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const String idType = 'INTER PRIMARY KEY AUTOINCREMENT';
    const boolType = 'BOOLEAN NOT NULL';
    const intergerType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';
    await db.execute(''' 
    CREATE TABLE $tableNotes (
      ${NoteFields.id} $idType,
      ${NoteFields.isImportant} $boolType,
      ${NoteFields.number} $intergerType,
      ${NoteFields.title} $textType,
      ${NoteFields.description}$textType,
      ${NoteFields.time} $textType,
    )
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
