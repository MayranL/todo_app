import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Task extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  Task({super.key, required this.taskName, required this.taskCompleted, required this.onChanged, required this.deleteTask});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(4),)
          ],
        ),

      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged),

            Text(taskName,
            style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),),

            // MaterialButton(
            //   child: Icon(Icons.delete),
            //   onPressed: deleteTask,
            // )
          ],
        ),
      ),
    ));
  }
}
