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
      'id' : id,
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


  Future<Database> createDatabase() async{
    return await openDatabase(
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

  Future<void> insertRecord(Record record) async {
    final Database db = await createDatabase();
    // Get a reference to the database.
    //final Database db = await database;

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

  Future<List<Record>> getAllRecord() async {
    // Get a reference to the database.
    final Database db = await createDatabase();
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('records');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Record(
        id: maps[i]['id'],
        user: maps[i]['user'],
        project: maps[i]['project'],
        device: maps[i]['device'],
        artifact: maps[i]['artifact'],
        latitude: maps[i]['latitude'],
        longitude: maps[i]['longitude'],
      );
    });
  }

}