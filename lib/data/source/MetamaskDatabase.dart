import 'dart:io';

import 'package:flutter/material.dart';
import 'package:metamask/config/config.dart';
import 'package:metamask/data/model/saldo_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p show join;

class MetamaskDatabase {
  static Database? _db;

  static final MetamaskDatabase db = MetamaskDatabase._();
  MetamaskDatabase._();

  Future<Database?> get database async {
    if (_db != null) return _db;

    _db = await initDB();

    return _db;
  }

  static Future<Database> initDB() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = p.join(directory.path, Config.dbName);

    debugPrint('DB path: $path');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // get table name from config
        db.execute(
          'CREATE TABLE ${Config.tblName} (id INTEGER PRIMARY KEY AUTOINCREMENT, saldo INTEGER)',
        );
      },
    );
  }

  Future<int> createSaldoForTheFirstTime() async {
    final db = await database;
    final int? count = Sqflite.firstIntValue(
      await db!.rawQuery('SELECT COUNT(*) FROM ${Config.tblName}'),
    );

    if (count == 0) {
      debugPrint('createSaldoForTheFirstTime');
      return await db.rawInsert(
        'INSERT INTO ${Config.tblName} (saldo) VALUES (0)',
      );
    } else {
      return 0;
    }
  }

  Future<SaldoModel> getSaldo() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(Config.tblName);

    return SaldoModel.fromMap(maps.first);
  }

  Future<int> addSaldo(int saldo) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(Config.tblName);

    final int currentSaldo = maps.first['saldo'];
    final int newSaldo = currentSaldo + saldo;

    return await db.update(
      Config.tblName,
      {'saldo': newSaldo},
      where: 'id = 1',
    );
  }
}
