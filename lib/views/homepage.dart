import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/widgets/TaskDisplay.dart';
import 'package:todo/main.dart';

class HomePage extends StatelessWidget {
  final submitController = TextEditingController();
  void clearText() {
    submitController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var tasks = appState.tasks;
    var theme = Theme.of(context);
    FocusNode entryFocus = FocusNode();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ToDo App v1.0'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height / 10),
          child: Align(
            alignment: Alignment.topCenter,
            child: ListView(
              children: <Widget>[
                TextField(
                  controller: submitController,
                  decoration: InputDecoration(
                    labelText: 'Enter task',
                    icon: Icon(
                      Icons.check_circle_outline,
                      semanticLabel: 'Add Task',
                    ),
                  ),
                  focusNode: entryFocus,
                  onSubmitted: (task) {
                    appState.addTask([task, false]);
                    clearText();
                    entryFocus.requestFocus();
                  },
                ),
                for (var task in tasks)
                  if (task[1] == false) TaskDisplay(theme: theme, task: task),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
