import 'package:flutter/material.dart';

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
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('To do List'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 0,
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                toDoList[index][0],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
