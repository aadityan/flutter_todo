import 'package:flutter/material.dart';
import 'package:todo/widgets/TaskDisplay.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tasks = [];

  void _addTask(task) {
    setState(() {
      tasks.add(task);
    });
  }

  var submitController = TextEditingController();
  void clearText() {
    submitController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ToDo App v1.0'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              for (var task in tasks) TaskDisplay(theme: theme, task: task),
              TextField(
                controller: submitController,
                decoration: InputDecoration(
                  labelText: 'Enter task',
                  icon: Icon(
                    Icons.check_circle_outline,
                    semanticLabel: 'Add Task',
                  ),
                ),
                onSubmitted: (task) {
                  _addTask(task);
                  clearText();
                },
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
