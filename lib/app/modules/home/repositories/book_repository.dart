import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';
import '../../../utils/database/init.database.dart';
import '../models/book_model.dart';
import 'book_repository_interface.dart';

class BookRepository extends Disposable implements IBookRepository {
  static final _table = "book";
  static Future<Database> _database;
  BookRepository() {
    _database = DatabaseHelper.instance.database;
  }

  Future<int> insert(BookModel row) async {
    final Database db = await _database;
    try {
      return await db.insert(_table, row.toMap());
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<List<BookModel>> queryAllRows() async {
    final Database db = await _database;
    try {
      final category = await db.query(_table);
      print(category);
      return List.generate(category.length, (i) {
        return BookModel(
          id: category[i]['id'],
          title: category[i]['title'],
          book_store_id: category[i]['book_store_id'],
          dateModification: category[i]['date_modification'],
        );
      });
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<int> queryRowCount() async {
    final Database db = await _database;
    try {
      return Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM $_table'));
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<int> update(BookModel row) async {
    final Database db = await _database;
    try {
      return await db
          .update(_table, row.toMap(), where: 'id = ?', whereArgs: [row.id]);
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<int> delete(id) async {
    final Database db = await _database;
    try {
      return await db.delete(_table, where: 'id = ?', whereArgs: [id]);
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<BookModel> findById(id) async {
    final Database db = await _database;
    try {
      List<Map<String, dynamic>> maps = await db.query("$_table",
          columns: ["id", "name", "date_modification", "date_create"],
          where: 'id = ?',
          whereArgs: [id]);

      if (maps.first.length > 0) {
        return BookModel.fromMap(maps.first);
      }
    } catch (error) {
      print(error);
    }

    return null;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
