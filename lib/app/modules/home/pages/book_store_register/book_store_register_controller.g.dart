// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_store_register_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BookStoreRegisterController = BindInject(
  (i) => BookStoreRegisterController(i<IBookStoreService>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BookStoreRegisterController on _BookStoreRegisterControllerBase, Store {
  final _$nameAtom = Atom(name: '_BookStoreRegisterControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$saveAsyncAction =
      AsyncAction('_BookStoreRegisterControllerBase.save');

  @override
  Future save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$_BookStoreRegisterControllerBaseActionController =
      ActionController(name: '_BookStoreRegisterControllerBase');

  @override
  dynamic setName(dynamic name) {
    final _$actionInfo = _$_BookStoreRegisterControllerBaseActionController
        .startAction(name: '_BookStoreRegisterControllerBase.setName');
    try {
      return super.setName(name);
    } finally {
      _$_BookStoreRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name}
    ''';
  }
}
