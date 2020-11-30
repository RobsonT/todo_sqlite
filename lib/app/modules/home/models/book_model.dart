import 'package:flutter/foundation.dart';
import 'dates_model.dart';

class BookModel extends DateCustom {
  final int id;
  final String title;
  final int book_store_id;

  BookModel({
    this.id,
    @required this.title,
    this.book_store_id,
    dateModification,
  }) : super(dateModification: dateModification);

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
        id: map['id'],
        title: map['title'],
        book_store_id: map['book_store_id'],
        dateModification: map['date_modification']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date_modification': dateModification,
      'book_store_id': book_store_id,
    };
  }

  @override
  String toString() {
    return 'BookModel{id: $id, name: $title, date_modification: $dateModification,date_create: $dateCreate}';
  }
}
