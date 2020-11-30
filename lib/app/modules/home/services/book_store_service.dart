import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../models/book_store_model.dart';
import '../repositories/book_store_repository_interface.dart';

import 'book_store_service_interface.dart';

class BookStoreService extends Disposable implements IBookStoreService {
  final IBookStoreRepository bookStoreRepository;
  BookStoreService({@required this.bookStoreRepository});

  Future<List<BookStoreModel>> queryAllRows() async {
    return await bookStoreRepository.queryAllRows();
  }

  Future<int> insert(BookStoreModel row) async {
    final id = await bookStoreRepository.insert(row);
    print('linha inserida id: $id');
    return id;
  }

  Future<BookStoreModel> findById(id) async {
    return await bookStoreRepository.findById(id);
  }

  Future<int> update(BookStoreModel row) async {
    final linesChanges = await bookStoreRepository.update(row);
    print('atualizadas $linesChanges linha(s)');
    return linesChanges;
  }

  Future<int> delete(id) async {
    final lineDelete = await bookStoreRepository.delete(id);
    print(lineDelete);
    return lineDelete;
  }

  Future<int> queryRowCount() async {
    return await bookStoreRepository.queryRowCount();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
