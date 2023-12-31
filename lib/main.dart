import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'ToDo App v1.0',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: HomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var tasks = [];

  void addTask(var entry) {
    Task t = Task(description: entry);
    tasks.add(t);
    notifyListeners();
  }

  void deleteTask(var task) {
    notifyListeners();
  }

  void completeTask(var task) {
    if (task.completed) {
      task.completed = false;
      task.completed_date = null;
    } else {
      task.completed = true;
      task.completed_date = DateTime.now();
    }
    notifyListeners();
  }
}

class Task {
  String description;
  bool completed = false;
  DateTime created_date;
  DateTime? completed_date;
  String? owner;

  Task({
    required this.description,
    DateTime? createdDate,
  }) : this.created_date = createdDate ?? DateTime.now();
}
