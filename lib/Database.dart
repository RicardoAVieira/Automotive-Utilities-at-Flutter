import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import './models/fuel_type_model.dart';
import './models/engine_dimensions_model.dart';
import './models/engine_results_model.dart';
import './models/fuel_result_model.dart';
import 'package:sqflite/sqflite.dart';

const tableEngineDimensions = "CREATE TABLE tableEngineDimensions ("
    "id INTEGER PRIMARY KEY,"
    "name TEXT,"
    "diameterOfCylinder REAL,"
    "crankshaftCourse REAL,"
    "chamberVolume REAL,"
    "pistonVolume REAL,"
    "numberOfPistons REAL,"
    "jointThinckness REAL,"
    "jointDiameter REAL"
    ");";

const tableEngineResults = "CREATE TABLE tableEngineResults ("
    "id INTEGER PRIMARY KEY,"
    "name TEXT,"
    "volumeCylinder REAL,"
    "volumeChamber REAL,"
    "totalVolume REAL,"
    "rateCylinder REAL,"
    "volumeEngine REAL,"
    "jointVolume REAL"
    ");";

const tableFuelResult = "CREATE TABLE tableFuelResult ("
    "id INTEGER PRIMARY KEY,"
    "name TEXT,"
    "amount REAL"
    ");";

const tableFuelType = "CREATE TABLE tableFuelType ("
    "id INTEGER PRIMARY KEY,"
    "name TEXT,"
    "liters REAL,"
    "price REAL"
    ");";

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "AutoCalc.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(tableEngineDimensions);
      await db.execute(tableEngineResults);
      await db.execute(tableFuelResult);
      await db.execute(tableFuelType);
    });
  }

  newEngineDimensions(EngineDimensions newEngineDimensions) async {
    final db = await database;
    //get the biggest id in the table
    var table =
        await db.rawQuery("SELECT MAX(id)+1 as id FROM tableEngineDimensions");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into tableEngineDimensions (id,name,diameterOfCylinder,crankshaftCourse,chamberVolume,pistonVolume,numberOfPistons,jointThinckness,jointDiameter)"
        " VALUES (?,?,?,?,?,?,?,?,?)",
        [
          id,
          newEngineDimensions.name,
          newEngineDimensions.diameterOfCylinder,
          newEngineDimensions.crankshaftCourse,
          newEngineDimensions.chamberVolume,
          newEngineDimensions.pistonVolume,
          newEngineDimensions.numberOfPistons,
          newEngineDimensions.jointThinckness,
          newEngineDimensions.jointDiameter,
        ]);
    return raw;
  }

  newEngineResults(EngineResults newEngineResults) async {
    final db = await database;
    //get the biggest id in the table
    var table =
        await db.rawQuery("SELECT MAX(id)+1 as id FROM tableEngineResults");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into tableEngineResults (id,name,volumeCylinder,volumeChamber,totalVolume,rateCylinder,volumeEngine,jointVolume)"
        " VALUES (?,?,?,?,?,?,?,?)",
        [
          id,
          newEngineResults.name,
          newEngineResults.volumeCylinder,
          newEngineResults.volumeChamber,
          newEngineResults.totalVolume,
          newEngineResults.rateCylinder,
          newEngineResults.volumeEngine,
          newEngineResults.jointVolume,
        ]);
    return raw;
  }

  netablewFuelType(FuelType newFuelType) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM FuelType");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into FuelType (id,name,liters,price)"
        " VALUES (?,?,?,?)",
        [
          id,
          newFuelType.name,
          newFuelType.liters,
          newFuelType.price,
        ]);
    return raw;
  }

  newFuelResult(FuelResult newFuelResult) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM FuelResult");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into FuelResult (id,name,amount)"
        " VALUES (?,?,?)",
        [
          id,
          newFuelResult.name,
          newFuelResult.amount,
        ]);
    return raw;
  }

  updateEngineDimensions(EngineDimensions newEngineDimensions) async {
    final db = await database;
    var res = await db.update(
        "tableEngineDimensions", newEngineDimensions.toMap(),
        where: "id = ?", whereArgs: [newEngineDimensions.id]);
    return res;
  }

  updateEngineResults(EngineResults newEngineResults) async {
    final db = await database;
    var res = await db.update("tableEngineResults", newEngineResults.toMap(),
        where: "id = ?", whereArgs: [newEngineResults.id]);
    return res;
  }

  updateFuelResult(FuelResult newFuelResult) async {
    final db = await database;
    var res = await db.update("tableFuelResult", newFuelResult.toMap(),
        where: "id = ?", whereArgs: [newFuelResult.id]);
    return res;
  }

  updateFuelType(FuelType newFuelType) async {
    final db = await database;
    var res = await db.update("tableFuelType", newFuelType.toMap(),
        where: "id = ?", whereArgs: [newFuelType.id]);
    return res;
  }

  getEngineDimensions(int id) async {
    final db = await database;
    var res = await db
        .query("tableEngineDimensions", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? EngineDimensions.fromMap(res.first) : null;
  }

  getEngineResults(int id) async {
    final db = await database;
    var res =
        await db.query("tableEngineResults", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? EngineResults.fromMap(res.first) : null;
  }

  getFuelResult(int id) async {
    final db = await database;
    var res =
        await db.query("tableFuelResult", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? FuelResult.fromMap(res.first) : null;
  }

  getFuelType(int id) async {
    final db = await database;
    var res = await db.query("tableFuelType", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? FuelType.fromMap(res.first) : null;
  }

  Future<List<EngineDimensions>> getAllEngineDimensions() async {
    final db = await database;
    var res = await db.query("tableEngineDimensions");
    List<EngineDimensions> list = res.isNotEmpty
        ? res.map((c) => EngineDimensions.fromMap(c)).toList()
        : [];
    return list;
  }

  Future<List<EngineResults>> getAllEngineResults() async {
    final db = await database;
    var res = await db.query("tableEngineResults");
    List<EngineResults> list =
        res.isNotEmpty ? res.map((c) => EngineResults.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<FuelResult>> getAllFuelResult() async {
    final db = await database;
    var res = await db.query("tableFuelResult");
    List<FuelResult> list =
        res.isNotEmpty ? res.map((c) => FuelResult.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<FuelType>> getAllFuelType() async {
    final db = await database;
    var res = await db.query("tableFuelType");
    List<FuelType> list =
        res.isNotEmpty ? res.map((c) => FuelType.fromMap(c)).toList() : [];
    return list;
  }

  deleteEngineDimensions(int id) async {
    final db = await database;
    return db.delete("tableEngineDimensions", where: "id = ?", whereArgs: [id]);
  }

  deleteEngineResults(int id) async {
    final db = await database;
    return db.delete("tableEngineResults", where: "id = ?", whereArgs: [id]);
  }

  deleteFuelResult(int id) async {
    final db = await database;
    return db.delete("tableFuelResult", where: "id = ?", whereArgs: [id]);
  }

  deleteFuelType(int id) async {
    final db = await database;
    return db.delete("tableFuelType", where: "id = ?", whereArgs: [id]);
  }

  deleteAllEngineDimensions() async {
    final db = await database;
    db.rawDelete("Delete * from tableEngineDimensions");
  }

  deleteAllEngineResults() async {
    final db = await database;
    db.rawDelete("Delete * from tableEngineResults");
  }

  deleteAllFuelResult() async {
    final db = await database;
    db.rawDelete("Delete * from tableFuelResult");
  }

  deleteAllFuelType() async {
    final db = await database;
    db.rawDelete("Delete * from tableFuelType");
  }
}
