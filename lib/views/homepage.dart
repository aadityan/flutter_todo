import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/widgets/TaskDisplay.dart';
import 'package:todo/widgets/appBar.dart';
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
      appBar: MyAppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height / 10),
          child: Column(
            children: [
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
                onSubmitted: (entry) {
                  appState.addTask(entry);
                  clearText();
                  entryFocus.requestFocus();
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(),
              ),
              Expanded(child: ReorderableTasks()),
            ],
          ),
        ),
      ),
    );
  }
}

class ReorderableTasks extends StatefulWidget {
  const ReorderableTasks({super.key});

  @override
  State<ReorderableTasks> createState() => _ReorderableTasksState();
}

class _ReorderableTasksState extends State<ReorderableTasks> {
  //final List<int> tasks = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final Color oddItemColor = Colors.blue.shade50;
    final Color evenItemColor = Colors.blue.shade50;
    var appState = context.watch<MyAppState>();
    var all_tasks = appState.tasks;
    var open_tasks = all_tasks.where((e) => e.completed == false).toList();
    var theme = Theme.of(context);

    final List<Card> cards = <Card>[
      for (int index = 0; index < open_tasks.length; index += 1)
        if (open_tasks[index].completed == false)
          Card(
            key: Key('$index'),
            color: index.isOdd ? oddItemColor : evenItemColor,
            child: TaskDisplay(
              task: open_tasks[index],
              theme: theme,
            ),
          ),
    ];

    Widget proxyDecorator(
        Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(1, 6, animValue)!;
          final double scale = lerpDouble(1, 1.02, animValue)!;
          return Transform.scale(
            scale: scale,
            // Create a Card based on the color and the content of the dragged one
            // and set its elevation to the animated value.
            child: Card(
              elevation: elevation,
              color: cards[index].color,
              child: cards[index].child,
            ),
          );
        },
        child: child,
      );
    }

    return ReorderableListView(
      // padding: const EdgeInsets.symmetric(horizontal: 40),
      proxyDecorator: proxyDecorator,
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final Task item = open_tasks.removeAt(oldIndex);
          open_tasks.insert(newIndex, item);
        });
      },
      children: cards,
    );
  }
}
