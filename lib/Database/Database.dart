import 'package:collection/collection.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Data {
  Database database;
  String filename = "demo.db";

  connect() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, filename);

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('CREATE TABLE count (id integer autoincremant primary key, name text, value integer, deleted intege)');
    });

    this.database = database;
  }

  disconnect() async {
    await database.close();
  }

  get() async {
    return database;
  }

  insert(String query) async {
    await get().transaction((txn) async {
      await txn.rawInsert(query);
    });
  }

  update(String query) async {
    await database.rawUpdate(query);
  }

  selectList(String query) async {
    return await database.rawQuery(query);
  }

  count(String query) async {
    Sqflite.firstIntValue(
        await database.rawQuery(query));
    assert(count == 2);
  }

  delete() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, filename);
    await deleteDatabase(path);
  }


  test() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, filename);

// Delete the database
    await deleteDatabase(path);

// open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });

// Insert some records in a transaction
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
      print('inserted1: $id1');
      int id2 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
          ['another name', 12345678, 3.1416]);
      print('inserted2: $id2');
    });

// Update some record
    int count = await database.rawUpdate(
        'UPDATE Test SET name = ?, VALUE = ? WHERE name = ?',
        ['updated name', '9876', 'some name']);
    print('updated: $count');

// Get the records
    List<Map> list = await database.rawQuery('SELECT * FROM Test');
    List<Map> expectedList = [
      {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
      {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
    ];

    print(list);
    print(expectedList);
    assert(const DeepCollectionEquality().equals(list, expectedList));

// Count the records
    count = Sqflite.firstIntValue(
        await database.rawQuery('SELECT COUNT(*) FROM Test'));
    assert(count == 2);

// Delete a record
    count = await database
        .rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
    assert(count == 1);

// Close the database
    await database.close();
  }
}
