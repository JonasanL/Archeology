import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Record {
  final int id;
  final String user;
  final String project;
  final String device;
  final String artifact;
  final String latitude;
  final String longitude;

  Record({this.id, this.user, this.project, this.device, this.artifact, this.latitude, this.longitude});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user,
      'project': project,
      'device': device,
      'artifact': artifact,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}


class SQLiteDatabase {
  Future<Database> database;



  void createDatabase() async{
    database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
        join(await getDatabasesPath(), 'database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
    return db.execute(
    "CREATE TABLE records(id INTEGER PRIMARY KEY, user TEXT, project TEXT, device TEXT, artifact TEXT, latitude TEXT, longitude TEXT)",
    );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
    );
  }

  Future<void> insertDog(Record record) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'records',
      record.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}