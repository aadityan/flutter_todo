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

  void addTask(var task) {
    tasks.add(task);
    notifyListeners();
  }

  void deleteTask(var task) {
    notifyListeners();
  }

  void completeTask(var task) {
    task[1] = true;
    notifyListeners();
  }
}
