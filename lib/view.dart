import 'package:flutter/material.dart';
import 'package:todo_app/task.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  List task = [
    ["First one", false],
    ["Second one", true],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      task[index][1] = !task[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[300],
        appBar: AppBar(
          backgroundColor: Colors.yellow[700],
          title: Text("Todo App"),
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: task.length,
          itemBuilder: (context, index) {
            return Task(
                taskName: task[index][0],
                taskCompleted: task[index][1],
                onChanged: (value) => checkBoxChanged(value, index));
          },
        ));
  }
}
