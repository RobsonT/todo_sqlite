import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../models/book_model.dart';
import '../repositories/book_repository.dart';
import 'book_service_interface.dart';

class BookService extends Disposable implements IBookService {
  final BookRepository bookRepository;
  BookService({@required this.bookRepository});

  Future<List<BookModel>> queryAllRows() async {
    return await bookRepository.queryAllRows();
  }

  Future<int> insert(BookModel row) async {
    final id = await bookRepository.insert(row);
    print('linha inserida id: $id');
    return id;
  }

  Future<BookModel> findById(id) async {
    return await bookRepository.findById(id);
  }

  Future<int> update(BookModel row) async {
    final linesChanges = await bookRepository.update(row);
    print('atualizadas $linesChanges linha(s)');
    return linesChanges;
  }

  Future<int> delete(id) async {
    final lineDelete = await bookRepository.delete(id);
    print(lineDelete);
    return lineDelete;
  }

  Future<int> queryRowCount() async {
    return await bookRepository.queryRowCount();
  }

  @override
  void dispose() {}
}
