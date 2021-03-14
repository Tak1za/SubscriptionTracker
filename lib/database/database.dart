import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:subscriber/models/subscription.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
        join(
          await getDatabasesPath(),
          "subscriptions.db",
        ),
        version: 1, onCreate: (db, version) async {
      await db.execute(
        "CREATE TABLE subscriptions (service TEXT PRIMARY KEY, cost INTEGER, paymentDate TEXT, period TEXT, nextPaymentDate TEXT, imagePath TEXT)",
      );
    });
  }

  newSubscription(Subscription subscription) async {
    final db = await database;
    return await db.insert(
      "subscriptions",
      subscription.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  getAllSubscriptions() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      "subscriptions",
    );

    var ret = List.generate(maps.length, (index) {
      return Subscription.fromMap(maps[index]);
    });

    return ret;
  }

  getSubscription(String serviceName) async {
    final db = await database;
    var res = await db.query(
      "subscriptions",
      where: "service = ?",
      whereArgs: [serviceName],
    );
    return res.isNotEmpty ? Subscription.fromMap(res.first) : Null;
  }

  removeSubscription(String serviceName) async {
    final db = await database;
    await db.delete(
      "subscriptions",
      where: "service = ?",
      whereArgs: [serviceName],
    );
  }

  removeAllSubscriptions() async {
    final db = await database;
    await db.delete("subscriptions");
  }

  updateSubscription(Subscription newSubscription) async {
    final db = await database;
    return await db.update(
      "subscriptions",
      newSubscription.toMap(),
      where: "service = ?",
      whereArgs: [newSubscription.serviceName],
    );
  }
}
