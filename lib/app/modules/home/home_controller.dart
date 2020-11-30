import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'models/book_model.dart';
import 'services/book_service_interface.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IBookService bookService;

  @observable
  ObservableList<BookModel> bookList;

  @action
  getList() async {
    bookList = (await bookService.queryAllRows()).asObservable();
  }

  @action
  save(BookModel model) async {
    await bookService.insert(model);
  }

  @action
  delete(int id) async {
    await bookService.delete(id);
    getList();
  }

  @action
  update(BookModel model) async {
    await bookService.update(model);
  }

  _HomeControllerBase(IBookService this.bookService) {
    getList();
  }
}
