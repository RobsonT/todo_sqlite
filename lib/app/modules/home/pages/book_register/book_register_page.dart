import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqlite_todo/app/modules/home/models/book_store_model.dart';
import 'book_register_controller.dart';

class BookRegisterPage extends StatefulWidget {
  final String title;
  const BookRegisterPage({Key key, this.title = "Cadastro de livro"})
      : super(key: key);

  @override
  _BookRegisterPageState createState() => _BookRegisterPageState();
}

class _BookRegisterPageState
    extends ModularState<BookRegisterPage, BookRegisterController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              TextFormField(
                onChanged: (v) => controller.setTitle(v),
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Título'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, insira o titulo';
                  }
                  return null;
                },
              ),
              TextFormField(
                onChanged: (v) => controller.setBookStoreId(int.parse(v)),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'id da livraria'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, insira o id da livraria';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    controller.save();
                  }
                },
                child: Text('Cadastrar'),
              )
            ])));
  }
}
