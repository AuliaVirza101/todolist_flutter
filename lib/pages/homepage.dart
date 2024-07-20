import 'package:flutter/material.dart';
import 'package:todolist_flutter/utils/todo_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Dummy data for toDoList
  List toDoList = [
    ['Buy groceries'],
    ['Walk the dog'],
    ['Read a book'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 107, 106, 106),
      appBar: AppBar(
        title: const Center(
          child: Text('To do List'),
        ),
        backgroundColor: Color.fromARGB(255, 12, 12, 12),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index) {
            return TodoList(
              taskName: toDoList[index][0],
            );
          }),
    );
  }
}
