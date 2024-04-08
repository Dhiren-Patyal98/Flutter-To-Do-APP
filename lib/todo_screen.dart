import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/add_todo_screen.dart';
import 'package:to_do/constant.dart';
import 'package:to_do/todo_provider.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: todoList.isEmpty
          ? const Center(
              child: Text('Well Done! You have completed your tasks'),
            )
          : ListView.builder(
              itemCount: todoList.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(todoList[index].title!),
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorlist[todoList[index].priority!],
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          )),
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      ref
                          .read(todoProvider.notifier)
                          .removeTodo(todoList[index]);
                    },
                  ),
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AddToDoScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
