import 'package:bloc_todo/domain/repositary/todo_repo.dart';
import 'package:bloc_todo/presentation/TodoView.dart';
import 'package:bloc_todo/presentation/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo;
  const TodoPage({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TodoCubit(todoRepo),
      child: TodoView(),
    );
  }
}
