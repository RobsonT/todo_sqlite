import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqlite_todo/app/modules/home/models/book_store_model.dart';
import 'package:sqlite_todo/app/modules/home/pages/book_register/book_register_page.dart';
import 'package:sqlite_todo/app/modules/home/services/book_store_service_interface.dart';

part 'book_store_register_controller.g.dart';

@Injectable()
class BookStoreRegisterController = _BookStoreRegisterControllerBase
    with _$BookStoreRegisterController;

abstract class _BookStoreRegisterControllerBase with Store {
  final IBookStoreService bookStoreService;

  @observable
  String name;

  @action
  setName(name) {
    this.name = name;
  }

  @action
  save() async {
    BookStoreModel bookStore = new BookStoreModel(name: name);
    await bookStoreService.insert(bookStore);
    Modular.to.pop();
  }

  _BookStoreRegisterControllerBase(this.bookStoreService);
}
