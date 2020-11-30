import 'package:flutter/foundation.dart';
import 'dates_model.dart';

class BookStoreModel extends DateCustom {
  final int id;
  final String name;

  BookStoreModel({
    this.id,
    @required this.name,
    dateModification,
  }) : super(dateModification: dateModification);

  factory BookStoreModel.fromMap(Map<String, dynamic> map) {
    return BookStoreModel(
        id: map['id'],
        name: map['name'],
        dateModification: map['date_modification']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'date_modification': dateModification};
  }

  @override
  String toString() {
    return 'BookStoreModel{id: $id, name: $name, date_modification: $dateModification,date_create: $dateCreate}';
  }
}
