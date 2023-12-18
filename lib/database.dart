import 'package:hive/hive.dart';

class ToDoDataBase {
  List task = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // 1st time ever opening this app
  void createInitialData(){
    task = [
      ["Finir tuto",false],
      ["Faire les projets",false],
    ];
  }

  // load the data from database
  void loadData() {
    task = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", task);
  }
}