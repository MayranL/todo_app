import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/view.dart';

void main() async {

  // init the hive
  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ViewPage(),
      theme: ThemeData(
        // TODO : Corriger erreur couleur appbar
        primarySwatch: Colors.yellow
      ),
    );
  }
}

