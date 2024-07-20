import 'package:flutter/material.dart';
import 'package:todolist_flutter/utils/todo_list.dart';

// HomePage is the main widget for the home screen of the To Do List application.
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Dummy data for toDoList
  List toDoList = [
    ['Buy groceries', false],
    ['Walk the dog', false],
    ['Read a book', false],
  ];

  // Controller to manage the text input for new tasks.
  final _controller = TextEditingController();

   // Method to toggle the completion status of a task.
  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

// Method to add a new task to the list.
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

// Method to delete a task from the list based on its index.
   void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 107, 106, 106),// Background color of the home screen.
      appBar: AppBar(
        title: const Center(
          child: Text('To do List'),// Title of the app bar.
        ),
        backgroundColor: Color.fromARGB(255, 12, 12, 12),// App bar background color.
        foregroundColor: Colors.white,// App bar text color.
      ),
      body: ListView.builder(
          itemCount: toDoList.length,// Number of items in the toDoList.
          itemBuilder: (BuildContext context, index) {
            return TodoList(
              taskName: toDoList[index][0], // Task name.
              taskCompleted: toDoList[index][1],// Task completion status.
              onChanged: (value) => checkBoxChanged(index),// Callback for checkbox state changes.
              deleteFunction: (contex) =>deleteTask(index),// Callback for deleting a task.
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Input new task',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
