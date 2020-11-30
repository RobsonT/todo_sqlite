import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'book_store_register_controller.dart';

class BookStoreRegisterPage extends StatefulWidget {
  final String title;
  const BookStoreRegisterPage({Key key, this.title = "Cadastrar livraria"})
      : super(key: key);

  @override
  _BookStoreRegisterPageState createState() => _BookStoreRegisterPageState();
}

class _BookStoreRegisterPageState
    extends ModularState<BookStoreRegisterPage, BookStoreRegisterController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            onChanged: (v) => controller.setName(v),
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Nome'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.save();
            },
            child: Text('Cadastrar'),
          )
        ],
      ),
    );
  }
}
