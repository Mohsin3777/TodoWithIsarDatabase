/*
Database repo
This Implement the todo repo and handles storing , retriving ,updating deleting ithe isar database

*/
import 'package:bloc_todo/data/models/isar_todo.dart';
import 'package:bloc_todo/domain/models/todo.dart';
import 'package:bloc_todo/domain/repositary/todo_repo.dart';
import 'package:isar/isar.dart';

class IsarTodoRepo implements TodoRepo {
  //database
  final Isar db;

  IsarTodoRepo(this.db);

  @override
  Future<List<Todo>> getTodos() async {
    // TODO: fetch from db
    final todos = await db.todoIsars.where().findAll();

    //return a list of todo and give a domain layer
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  @override
  Future<void> addTodos(Todo todo) {
    // TODO: implement addTodos
    final todosIsar = TodoIsar.fromDomain(todo);
    return db.writeTxn(() => db.todoIsars.put(todosIsar));
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await db.writeTxn(() => db.todoIsars.delete(todo.id));
  }

  @override
  Future<void> updateTodo(Todo todo) {
    final todosIsar = TodoIsar.fromDomain(todo);
    return db.writeTxn(() => db.todoIsars.put(todosIsar));
  }
}
