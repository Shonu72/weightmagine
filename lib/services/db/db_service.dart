import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weightmagine/src/models/weight_model.dart';

class DatabaseService extends GetxService {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    final path = await getDatabasesPath();
    String dbPath = join(path, 'weights.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE weights (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT,
            weight REAL
          )
          ''',
        );
      },
    );
  }

  Future<int> insertWeight(WeightModel weight) async {
    final db = await database;
    return await db!.insert('weights', weight.toMap());
  }

  Future<List<WeightModel>> getAllWeights() async {
    final db = await database;
    var result = await db!.query('weights');
    return result.map((map) => WeightModel.fromMap(map)).toList();
  }

  Future<int> deleteWeight(int id) async {
    final db = await database;
    return await db!.delete('weights', where: 'id = ?', whereArgs: [id]);
  }
}
