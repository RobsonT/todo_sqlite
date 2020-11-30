import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqlite_todo/app/modules/home/models/book_model.dart';
import 'package:sqlite_todo/app/modules/home/models/book_store_model.dart';
import 'package:sqlite_todo/app/modules/home/services/book_service_interface.dart';
import 'package:sqlite_todo/app/modules/home/services/book_store_service_interface.dart';

part 'book_register_controller.g.dart';

@Injectable()
class BookRegisterController = _BookRegisterControllerBase
    with _$BookRegisterController;

abstract class _BookRegisterControllerBase with Store {
  final IBookService bookService;
  final IBookStoreService bookStoreService;

  @observable
  String title;

  @observable
  int bookStoreId;

  @action
  void setTitle(String title) {
    this.title = title;
  }

  @action
  void setBookStoreId(int bookStoreId) {
    this.bookStoreId = bookStoreId;
  }

  @action
  save() async {
    BookModel model =
        BookModel(title: this.title, book_store_id: this.bookStoreId);
    await bookService.insert(model);
    ObservableList<BookModel> bookList =
        (await bookService.queryAllRows()).asObservable();
    Modular.to.pop(bookList);
  }

  _BookRegisterControllerBase(
      {@required this.bookService, @required this.bookStoreService});
}
