import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key,required this.taskName});
final String taskName;

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(
        top:20,
        left:20,
        right:20,
        bottom:0,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color:  Color.fromARGB(255, 31, 27, 27),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          taskName,
          style: const TextStyle(
            color: Colors.white,
            fontSize:18,
          ),
        ),
      ),
    );
  }
}
