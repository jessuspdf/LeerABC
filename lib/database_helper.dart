import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'bd3.db');

    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE records(id INTEGER PRIMARY KEY, name TEXT, username TEXT, userType TEXT, gender TEXT, password TEXT)',
        );
      },
      version: 1,
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < 2) {
          db.execute('ALTER TABLE records ADD COLUMN username TEXT');
        }
      },
    );
  }

  Future<Map<String, dynamic>?> validateUser(
      String username, String password) async {
    final db = await database;
    final result = await db.query(
      'records',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<void> insertRecord(Map<String, dynamic> record) async {
    final db = await database;
    await db.insert('records', record,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
