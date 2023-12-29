import 'package:flutter/material.dart';

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
    return ListTile(
      leading: IconButton(
        icon: Icon(
          Icons.check,
          semanticLabel: 'Complete Task',
        ),
        color: theme.colorScheme.primary,
        onPressed: () => (),
      ),
      title: Text(task),
    );
  }
}
