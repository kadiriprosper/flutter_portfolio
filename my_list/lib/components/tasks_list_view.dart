import 'package:flutter/material.dart';
import 'package:my_list/components/icons_row.dart';
import 'package:my_list/screens/task_screen.dart';
import 'package:my_list/services/tasks.dart';
import 'package:my_list/services/tasks_provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.provider,
    required this.tasks,
  }) : super(key: key);

  final Tasks provider;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    bool? shouldDelete;
    if (tasks.isNotEmpty) {
      return ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.lightBlueAccent.shade100,
        ),
        shrinkWrap: true,
        primary: true,
        itemCount: tasks.length,
        itemBuilder: ((context, index) {
          return Dismissible(
            key: const Key('LIST CHILD'),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: Colors.red,
              child: const Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.delete),
              ),
            ),
            onDismissed: ((direction) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('"${tasks[index].label}" removed'),
                ),
              );
              provider.removeTask(tasks[index], index);
            }),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            provider.setDone(tasks[index], index);
                          },
                          icon: tasks[index].isDone
                              ? const Icon(
                                  Icons.check_box_outlined,
                                  color: Colors.blue,
                                )
                              : const Icon(
                                  Icons.check_box_outline_blank_rounded),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            // width: MediaQuery.of(context).size.width / 2,
                            child: InkWell(
                              onTap: () async {
                                shouldDelete = await Navigator.of(context).push(
                                  MaterialPageRoute<bool>(
                                    builder: (context) {
                                      return TaskScren(
                                          task: tasks[index], index: index);
                                    },
                                  ),
                                );
                                if (shouldDelete == true) {
                                  provider.removeTask(tasks[index], index);
                                }
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    // width: MediaQuery.of(context).size.width / 2,

                                    child: Text(
                                      tasks[index].label,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      style: TextStyle(
                                        decoration:
                                            provider.isDone(tasks[index]),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text('Author: ${tasks[index].author}'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconRow(
                    provider: provider,
                    tasks: tasks[index],
                    index: index,
                  ),
                )
              ],
            ),
          );
        }),
      );
    } else {
      return const Text('Empty List');
    }
  }
}
