import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSingleton {
  static final DatabaseSingleton instance = DatabaseSingleton._init();
  static Database? _db;

  DatabaseSingleton._init();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      if (kIsWeb) {
        throw UnsupportedError("Web is not supported");
      } else {
        // app runs on mobile / PC -> use SQLite Database

        // initialize the DB on first use
        _db = await openDatabase(
          join(await getDatabasesPath(), "logic_app.db"),
          onCreate: (db, version) async {
            return await db.execute(
                'CREATE TABLE tokens(id INTEGER PRIMARY KEY, token TEXT)');
          },
          version: 2,
        );
      }
    }
    return _db!;
  }

  Future<String> getToken() async {
    final db = await instance.db;
    final result = await db.query("tokens", columns: ['id', 'token']);
    if (result.isEmpty) {
      return Future.value("");
    }
    return result.last["token"] as String;
  }

  Future<void> saveToken(String token) async {
    final db = await instance.db;
    final _ = await db.insert("tokens", {"id": 0, "token": token},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteToken() async {
    final db = await instance.db;
    final _ = await db.delete("tokens");
  }
}

final databaseProvider = Provider<DatabaseSingleton>(
  (ref) {
    return DatabaseSingleton.instance;
  },
);
