// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<IBookService>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$bookListAtom = Atom(name: '_HomeControllerBase.bookList');

  @override
  ObservableList<BookModel> get bookList {
    _$bookListAtom.reportRead();
    return super.bookList;
  }

  @override
  set bookList(ObservableList<BookModel> value) {
    _$bookListAtom.reportWrite(value, super.bookList, () {
      super.bookList = value;
    });
  }

  final _$getListAsyncAction = AsyncAction('_HomeControllerBase.getList');

  @override
  Future getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  final _$saveAsyncAction = AsyncAction('_HomeControllerBase.save');

  @override
  Future save(BookModel model) {
    return _$saveAsyncAction.run(() => super.save(model));
  }

  final _$deleteAsyncAction = AsyncAction('_HomeControllerBase.delete');

  @override
  Future delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  final _$updateAsyncAction = AsyncAction('_HomeControllerBase.update');

  @override
  Future update(BookModel model) {
    return _$updateAsyncAction.run(() => super.update(model));
  }

  @override
  String toString() {
    return '''
bookList: ${bookList}
    ''';
  }
}
