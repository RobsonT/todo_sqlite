import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'home_controller.dart';
import 'models/book_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Observer(builder: (_) {
          if (controller.bookList != null && controller.bookList.isNotEmpty) {
            List<BookModel> bookList = controller.bookList;
            return ListView.builder(
                itemCount: bookList.length,
                itemBuilder: (_, int index) {
                  BookModel model = bookList[index];
                  return ListTile(
                    title: Text(model.title),
                    subtitle: Text(model.dateCreate.toString()),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          controller.delete(model.id);
                        }),
                    onTap: () {},
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Card(
                elevation: 0,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 75,
                        width: 150,
                        child: Column(
                          children: [
                            FlatButton(
                              onPressed: () async {
                                controller.bookList =
                                    await Modular.link.pushNamed(
                                  '/book_register',
                                );
                              },
                              padding: EdgeInsets.all(0.0),
                              child: Icon(Icons.add),
                            ),
                            Text('Adicionar livro')
                          ],
                        ),
                      ),
                      SizedBox(width: 50),
                      Container(
                        height: 75,
                        width: 150,
                        child: Column(
                          children: [
                            FlatButton(
                              onPressed: () {
                                Modular.link.pushNamed(
                                  '/book_store_register',
                                );
                              },
                              padding: EdgeInsets.all(0.0),
                              child: Icon(Icons.home),
                            ),
                            Text('Adicionar livraria')
                          ],
                        ),
                      ),
                    ]))));
  }
}
