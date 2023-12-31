import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/widgets/TaskDisplay.dart';
import 'package:todo/widgets/appBar.dart';
import 'package:todo/main.dart';

class CompletedTasks extends StatelessWidget {
  final submitController = TextEditingController();
  void clearText() {
    submitController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var tasks = appState.tasks;
    var theme = Theme.of(context);

    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height / 10),
          child: Align(
            alignment: Alignment.topCenter,
            child: ListView(
              children: <Widget>[
                for (var task in tasks)
                  if (task.completed) TaskDisplay(theme: theme, task: task),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
