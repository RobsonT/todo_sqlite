import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'database.enum.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  static _initDatabase() async {
    try {
      String path = join(
          await getDatabasesPath(), DatabaseHelperEnum.getValue(DATABASE.name));
      await deleteDatabase(path);
      return await openDatabase(path,
          version: DatabaseHelperEnum.getValue(DATABASE.version),
          onCreate: _onCreate,
          onConfigure: _onConfigure);
    } catch (error) {
      print(error);
    }
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
    print('Foreign keys turned on');
  }

  static Future _onCreate(Database db, int version) async {
    var sql = [
      '''DROP TABLE IF EXISTS dog;''',
      '''DROP TABLE IF EXISTS canil;''',
      '''create table if not exists book (
            id integer primary key autoincrement,
            title text,
            date_modification datetime,
            date_create datetime,
            book_store_id int NOT NULL,
            foreign key (book_store_id) references book_store (id) ON DELETE CASCADE
          );''',
      '''create table if not exists book_store (
            id integer primary key autoincrement,
            name text,
            date_modification datetime,
            date_create datetime
            );''',
      '''insert into book_store (name,date_create)
             values('Saraiva',strftime('%d-%m-%Y %H:%M:%S', datetime('now')));''',
      '''insert into book_store (name,date_create)
             values('Cultura',strftime('%d-%m-%Y %H:%M:%S', datetime('now')));''',
      '''insert into book_store (name,date_create)
             values('Livraria leitura',strftime('%d-%m-%Y %H:%M:%S', datetime('now')));''',
      '''insert into book (title, date_create, book_store_id) values('Flutter na pratica',strftime('%d-%m-%Y %H:%M:%S', datetime('now')), 1);''',
      '''insert into book (title, date_create, book_store_id) values('O senhor dos anéis',strftime('%d-%m-%Y %H:%M:%S', datetime('now')), 2);''',
      '''insert into book (title, date_create, book_store_id) values('O nome do vento',strftime('%d-%m-%Y %H:%M:%S', datetime('now')),3);''',
    ];

    for (var i = 0; i < sql.length; i++) {
      print("execute sql : " + sql[i]);
      await db.execute(sql[i]).catchError((onError) => print(onError));
    }
  }
}
