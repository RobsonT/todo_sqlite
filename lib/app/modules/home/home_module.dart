import 'package:mobx/mobx.dart';

import 'models/book_model.dart';
import 'pages/book_store_register/book_store_register_controller.dart';
import 'pages/book_register/book_register_controller.dart';
import 'pages/book_register/book_register_page.dart';
import 'pages/book_store_register/book_store_register_page.dart';
import 'repositories/book_store_repository_interface.dart';
import 'repositories/book_repository_interface.dart';
import 'services/book_store_service_interface.dart';
import 'services/book_service_interface.dart';

import 'repositories/book_store_repository.dart';
import 'repositories/book_repository.dart';
import 'services/book_store_service.dart';
import 'services/book_service.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $BookStoreRegisterController,
        Bind<IBookStoreRepository>((i) => BookStoreRepository()),
        Bind<IBookRepository>((i) => BookRepository()),
        Bind<IBookStoreService>(
            (i) => BookStoreService(bookStoreRepository: i.get())),
        Bind<IBookService>((i) => BookService(bookRepository: i.get())),
        Bind((i) => BookRegisterController(
            bookService: i.get(), bookStoreService: i.get())),
        Bind((i) => HomeController(i.get())),
        Bind((i) => BookStoreRegisterController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter<ObservableList<BookModel>>('/book_register',
            child: (_, args) => BookRegisterPage()),
        ModularRouter('/book_store_register',
            child: (_, args) => BookStoreRegisterPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
