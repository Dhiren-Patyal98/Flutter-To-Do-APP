// import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/constant.dart';
import 'package:to_do/todo.dart';
import 'package:to_do/todo_provider.dart';

class AddToDoScreen extends ConsumerWidget {
  AddToDoScreen({super.key});
  final todoController =TextEditingController();
int priority =0;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
        
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: todoController,
              decoration: InputDecoration(
                hintText: 'What needs to be done ?'),
            ),
          ),
          SizedBox(
            height: 70,
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: colorlist.length
              ,itemBuilder: (context , index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      priority = index;
                       
                   
              
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorlist[index],
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        )
                      ),
                    ),
                  ),
                );
              }
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            final todo =Todo(
              title :todoController.text,
              id:DateTime.now().millisecondsSinceEpoch.toString(),
              isDone: false,
              priority:priority,
            );
            ref.read(todoProvider.notifier).addTodo(todo);
            todoController.clear();
            Navigator.of(context).pop();
          },
           child: const Text('Add to List'))
        ],
      ),
    );
  }
}