import 'package:flutter/material.dart';
import 'package:my_list/services/tasks.dart';
import 'package:my_list/services/tasks_provider.dart';

class IconRow extends StatelessWidget {
  const IconRow({
    Key? key,
    required this.provider,
    required this.tasks,
    required this.index,
  }) : super(key: key);

  final Tasks provider;
  final Task tasks;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              provider.setFav(tasks, index);
            },
            icon: tasks.isFavourite
                ? const Icon(
                    Icons.favorite_rounded,
                    color: Colors.pink,
                  )
                : const Icon(
                    Icons.favorite_outline_rounded,
                  ),
          ),
          IconButton(
            onPressed: () {
              provider.setPlanned(tasks, index);
            },
            icon: tasks.isPlan
                ? const Icon(
                    Icons.lightbulb_rounded,
                    color: Colors.yellow,
                  )
                : const Icon(
                    Icons.lightbulb_outline_rounded,
                  ),
          ),
          IconButton(
            onPressed: () {
              provider.setImportant(tasks, index);
            },
            icon: tasks.isImportant
                ? const Icon(
                    Icons.label_important_rounded,
                    color: Colors.blue,
                  )
                : const Icon(Icons.label_important_outline_rounded),
          ),
        ],
      ),
    );
  }
}
