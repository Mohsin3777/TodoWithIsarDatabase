import 'package:bloc_todo/domain/models/todo.dart';

abstract class TodoRepo {
  //get list of todos
  Future<List<Todo>> getTodos();

  //add a new todo
  Future<void> addTodos(Todo todo);

  //update an existing todo
  Future<void> updateTodo(Todo todo);

  //delete a todo
  Future<void> deleteTodo(Todo todo);
}
