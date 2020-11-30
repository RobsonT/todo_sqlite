// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_register_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BookRegisterController = BindInject(
  (i) => BookRegisterController(
      bookService: i<IBookService>(), bookStoreService: i<IBookStoreService>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BookRegisterController on _BookRegisterControllerBase, Store {
  final _$titleAtom = Atom(name: '_BookRegisterControllerBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$bookStoreIdAtom =
      Atom(name: '_BookRegisterControllerBase.bookStoreId');

  @override
  int get bookStoreId {
    _$bookStoreIdAtom.reportRead();
    return super.bookStoreId;
  }

  @override
  set bookStoreId(int value) {
    _$bookStoreIdAtom.reportWrite(value, super.bookStoreId, () {
      super.bookStoreId = value;
    });
  }

  final _$saveAsyncAction = AsyncAction('_BookRegisterControllerBase.save');

  @override
  Future save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$_BookRegisterControllerBaseActionController =
      ActionController(name: '_BookRegisterControllerBase');

  @override
  void setTitle(String title) {
    final _$actionInfo = _$_BookRegisterControllerBaseActionController
        .startAction(name: '_BookRegisterControllerBase.setTitle');
    try {
      return super.setTitle(title);
    } finally {
      _$_BookRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBookStoreId(int bookStoreId) {
    final _$actionInfo = _$_BookRegisterControllerBaseActionController
        .startAction(name: '_BookRegisterControllerBase.setBookStoreId');
    try {
      return super.setBookStoreId(bookStoreId);
    } finally {
      _$_BookRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
bookStoreId: ${bookStoreId}
    ''';
  }
}
