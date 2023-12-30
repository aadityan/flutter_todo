import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/main.dart';

class TaskDisplay extends StatelessWidget {
  const TaskDisplay({
    super.key,
    required this.theme,
    required this.task,
  });

  final ThemeData theme;
  final task;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return ListTile(
      leading: IconButton(
        icon: Icon(
          Icons.check_circle_outline,
          semanticLabel: 'Complete Task',
        ),
        color: theme.colorScheme.primary,
        onPressed: () => appState.completeTask(task),
      ),
      title: Text(task[0]),
    );
  }
}
