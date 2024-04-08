// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/todo.dart';

class TodoProvider extends StateNotifier<List<Todo>> {
  TodoProvider() : super([]);

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void removeTodo(Todo todo) {
    state = state.where((element) => element.id != todo.id).toList();
  }
}


final todoProvider = StateNotifierProvider<TodoProvider,List<Todo>>((ref) {
  return TodoProvider();
});