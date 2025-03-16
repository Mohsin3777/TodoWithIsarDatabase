/*


Each cubit is a list of todos
*/
import 'package:bloc_todo/domain/models/todo.dart';
import 'package:bloc_todo/domain/repositary/todo_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<Todo>> {
  //reference todo repo
  final TodoRepo todoRepo;

  //Constructor initilize the cubit with empty constructor
  TodoCubit(this.todoRepo) : super([]) {
    loadTodo();
  }

  //load
  Future<void> loadTodo() async {
    final todoList = await todoRepo.getTodos();
    //emit the fatch list as the  new state

    emit(todoList);
  }

  //add
  Future<void> addTodo(String text) async {
    final newTodo = Todo(id: DateTime.now().microsecondsSinceEpoch, text: text);
    //save the new added in db

    await todoRepo.addTodos(newTodo);

    //re-load
    loadTodo();
  }
  //delete

  Future<void> deleteTodo(Todo todo) async {
    //save the dodo from db
    await todoRepo.deleteTodo(todo);

    //re-load
    loadTodo();
  }

  //toggle
  Future<void> toggleTodo(Todo todo) async {
    final updateTodo = todo.toggleCompleted();
    //update the todo in repo with new status

    await todoRepo.updateTodo(updateTodo);

    //re-load
    loadTodo();
  }
}
