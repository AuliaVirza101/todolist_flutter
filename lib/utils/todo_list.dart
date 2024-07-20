import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;// Function to handle changes in checkbox state.
  final Function(BuildContext)? deleteFunction;// Function to handle task deletion.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      
       child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),// Defines the motion effect for the slidable action.
          children: [
            SlidableAction(
              onPressed: deleteFunction,// Function to call when the delete action is triggered.
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(15),// Radius for rounded corners of the action button.
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),// Padding inside the container.
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 19, 17, 21),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,// Determines if the checkbox is checked or not.
                onChanged: onChanged,// Callback when the checkbox state changes.
                checkColor: Colors.black,
                activeColor: Colors.white,
                side: const BorderSide(
                  color: Colors.white,
                ),
              ),
              // Text widget to display the task name.
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough // Strike-through if the task is completed.
                      : TextDecoration.none, // No decoration if the task is not completed.
                  decorationColor: Colors.white,
                  decorationThickness: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
