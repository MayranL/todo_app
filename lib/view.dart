import 'package:flutter/material.dart';
import 'package:todo_app/new_task.dart';
import 'package:todo_app/task.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  final _controller = TextEditingController();

  List task = [
    ["First one", false],
    ["Second one", true],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      task[index][1] = !task[index][1];
    });
  }

  // Save new task
  void saveNewTask(){
setState(() {
  task.add([_controller.text, false]);
  _controller.clear();
  Navigator.of(context).pop();
});  }

  void createNewTask() {
    showDialog(context: context, builder: (context){
      return NewTask(controller: _controller, onSave: saveNewTask,onCancel: () => Navigator.of(context).pop());
    });
  }

  void deleteTask(int index){
    setState(() {
      task.removeAt(index);
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
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: task.length,
          itemBuilder: (context, index) {
            return Task(
                taskName: task[index][0],
                taskCompleted: task[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteTask: (context) => deleteTask(index),
            );}
        ));
  }
}
