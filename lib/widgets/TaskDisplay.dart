import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/main.dart';
import 'package:intl/intl.dart';

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
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    String trailingString = '';
    if (task.completed) {
      trailingString = 'Completed on ${formatter.format(task.completed_date)}';
    } else {
      trailingString = 'Created on ${formatter.format(task.created_date)}';
    }

    return ListTile(
      leading: IconButton(
        icon: Icon(
          Icons.check_circle_outline,
          semanticLabel: 'Complete Task',
        ),
        color: theme.colorScheme.primary,
        onPressed: () => appState.completeTask(task),
      ),
      title: Text(task.description),
      trailing: Text(trailingString),
    );
  }
}
