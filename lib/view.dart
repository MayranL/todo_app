import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/database.dart';
import 'package:todo_app/new_task.dart';
import 'package:todo_app/task.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if it's 1st time, create default data
    if (_myBox.get("TODOLIST") == null){
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.task[index][1] = !db.task[index][1];
    });
    db.updateDataBase();
  }

  // Save new task
  void saveNewTask() {
    setState(() {
      db.task.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return NewTask(
              controller: _controller,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.task.removeAt(index);
    });
    db.updateDataBase();
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
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: db.task.length,
            itemBuilder: (context, index) {
              return Task(
                taskName: db.task[index][0],
                taskCompleted: db.task[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteTask: (context) => deleteTask(index),
              );
            }));
  }
}
