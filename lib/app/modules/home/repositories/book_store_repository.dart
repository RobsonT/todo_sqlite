import 'package:flutter_modular/flutter_modular.dart';
import '../../../utils/database/init.database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_todo/app/modules/home/models/book_store_model.dart';

import 'book_store_repository_interface.dart';

@Injectable()
class BookStoreRepository extends Disposable implements IBookStoreRepository {
  static final _table = 'book_store';

  Future<Database> _database() {
    return DatabaseHelper.instance.database;
  }

  @override
  Future<int> delete(id) async {
    final Database db = await _database();
    try {
      return await db.delete(_table, where: 'id = ?', whereArgs: [id]);
    } catch (error) {
      print(error);
    }
    return null;
  }

  @override
  Future<BookStoreModel> findById(id) async {
    final Database db = await _database();
    try {
      List<Map<String, dynamic>> maps = await db.query("$_table",
          columns: ["id", "name", "date_modification", "date_create"],
          where: 'id = ?',
          whereArgs: [id]);

      if (maps.first.length > 0) {
        return BookStoreModel.fromMap(maps.first);
      }
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  Future<int> insert(BookStoreModel row) async {
    final Database db = await _database();
    try {
      return await db.insert(_table, row.toMap());
    } catch (error) {
      print(error);
    }
    return null;
  }

  @override
  Future<List<BookStoreModel>> queryAllRows() async {
    final Database db = await _database();
    try {
      final category = await db.query(_table);

      return List.generate(category.length, (i) {
        return BookStoreModel(
          id: category[i]['id'],
          name: category[i]['name'],
          dateModification: category[i]['date_modification'],
        );
      });
    } catch (error) {
      print(error);
    }
    return null;
  }

  @override
  Future<int> queryRowCount() async {
    final Database db = await _database();
    try {
      return Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM $_table'));
    } catch (error) {
      print(error);
    }
    return null;
  }

  @override
  Future<int> update(BookStoreModel row) async {
    final Database db = await _database();
    try {
      return await db
          .update(_table, row.toMap(), where: 'id = ?', whereArgs: [row.id]);
    } catch (error) {
      print(error);
    }
    return null;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
