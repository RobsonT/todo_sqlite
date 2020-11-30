import '../models/book_store_model.dart';

abstract class IBookStoreService {
  Future<int> insert(BookStoreModel row);
  Future<List<BookStoreModel>> queryAllRows();
  Future<int> queryRowCount();
  Future<int> update(BookStoreModel row);
  Future<int> delete(id);
  Future<BookStoreModel> findById(id);
}
