import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text('ToDo App v2.0'),
      actions: <Widget>[
        IconButton(
          onPressed: () => (),
          icon: const Icon(
            Icons.check_circle_outline,
            semanticLabel: "Go to Tasks",
          ),
        ),
        IconButton(
          onPressed: () => (),
          icon: const Icon(
            Icons.check_circle,
            semanticLabel: "Go to Completed Tasks",
          ),
        ),
        SizedBox(
          width: 50,
        ),
      ],
    );
  }
}
