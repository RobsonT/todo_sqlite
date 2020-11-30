import 'package:flutter/material.dart';
import 'package:sqlite_todo/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqlite_todo/app/utils/database/init.database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database;
  runApp(ModularApp(module: AppModule()));
}
