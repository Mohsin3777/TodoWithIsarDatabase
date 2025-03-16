import 'package:bloc_todo/data/models/isar_todo.dart';
import 'package:bloc_todo/data/repositary/isar_todo_repo.dart';
import 'package:bloc_todo/domain/repositary/todo_repo.dart';
import 'package:bloc_todo/presentation/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //get directory path for storing data
  final dir = await getApplicationDocumentsDirectory();

  //open Isar database
  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);
  //initilize the repo with isar database
  final isarTodoRepo = IsarTodoRepo(isar);
  runApp(MyApp(
    todoRepo: isarTodoRepo,
  ));
}

class MyApp extends StatelessWidget {
  final TodoRepo todoRepo;
  const MyApp({super.key, required this.todoRepo});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TodoPage(todoRepo: todoRepo),
    );
  }
}
