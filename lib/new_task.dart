import 'package:flutter/material.dart';
import 'package:todo_app/my_button.dart';

class NewTask extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  NewTask({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Here we go"),
      content: Container(
        width: MediaQuery.of(context).size.width/3,
        height: MediaQuery.of(context).size.height/3,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Ajout d'une task",
              ),
            ),
            Row(
              children: [
                // Save button
                MyButton(text: "Save", onPressed: onSave),

                const SizedBox(width: 8,),

                // Cancel button
                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
