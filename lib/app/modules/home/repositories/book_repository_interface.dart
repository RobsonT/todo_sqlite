import '../models/book_model.dart';

abstract class IBookRepository {
  Future<int> insert(BookModel row);
  Future<List<BookModel>> queryAllRows();
  Future<int> queryRowCount();
  Future<int> update(BookModel row);
  Future<int> delete(id);
  Future<BookModel> findById(id);
}
