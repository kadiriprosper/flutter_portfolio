import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:my_list/components/custom_appbar.dart';
import 'package:my_list/components/icon_row_button.dart';
import 'package:my_list/components/icons_row.dart';
import 'package:my_list/constants/constants.dart';
import 'package:my_list/services/tasks.dart';
import 'package:my_list/services/tasks_provider.dart';
import 'package:provider/provider.dart';

class TaskScren extends StatefulWidget {
  const TaskScren({Key? key, required this.task, required this.index})
      : super(key: key);
  final Task task;
  final int index;
  @override
  State<TaskScren> createState() => _TaskScrenState();
}

class _TaskScrenState extends State<TaskScren> {
  late Task task;
  late String edittedText;
  late TextEditingController controller;
  late Tasks provider = Provider.of(context, listen: false);
  @override
  void initState() {
    task = widget.task;
    controller = TextEditingController()..text = task.label;
    edittedText = controller.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        label: 'Edit Task',
        splashColor: Colors.transparent,
      ).build(context),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: provider.editTextContainerColor,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Edited ${getMonth(task.editedTime!.toLocal().month)} '
                    '${task.editedTime!.toLocal().day}',
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        IconRow(
                          index: widget.index,
                          provider: Provider.of<Tasks>(context),
                          tasks: task,
                        ),
                        // IconButton(
                        //   onPressed: () {
                        //     Navigator.pop(context, true);
                        //   },
                        //   icon: const Icon(
                        //     Icons.delete,
                        //     color: Colors.redAccent,
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: provider.editTextContainerColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: controller,
                  minLines: null,
                  maxLines: null,
                  decoration: null,
                  expands: true,
                  onChanged: (value) {
                    edittedText = value;
                    task.label = edittedText;
                    task.editedTime = DateTime.now();
                    provider.updateTask(task, widget.index);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ColorIcon(
                    provider: provider,
                    color: Colors.transparent,
                    child: const Icon(Icons.cancel),
                  ),
                  ColorIcon(
                    provider: provider,
                    color: Colors.red,
                  ),
                  ColorIcon(
                    provider: provider,
                    color: Colors.blue,
                  ),
                  ColorIcon(
                    provider: provider,
                    color: Colors.white,
                  ),
                  ColorIcon(
                    provider: provider,
                    color: Colors.yellow,
                  ),
                  ColorIcon(
                    provider: provider,
                    color: Colors.orange,
                  ),
                  ColorIcon(
                    provider: provider,
                    color: Colors.pink,
                  ),
                  ColorIcon(
                    provider: provider,
                    color: Colors.green,
                  ),
                  ColorIcon(
                    provider: provider,
                    color: Colors.teal,
                  ),
                  ColorIcon(
                    provider: provider,
                    color: Colors.grey,
                  ),
                  ColorIcon(
                    provider: provider,
                    color: Colors.amber,
                  ),
                  ColorIcon(
                    provider: provider,
                    color: Colors.cyan,
                  ),
                  ColorIcon(
                    provider: provider,
                    color: Colors.indigo,
                  ),
                  ColorIcon(
                    provider: provider,
                    color: Colors.lime,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getMonth(int month) {
    return Months.values[month - 1].toString().replaceRange(0, 7, '');
  }
}

class ColorIcon extends StatelessWidget {
  const ColorIcon({
    Key? key,
    required this.provider,
    required this.color,
    this.child,
  }) : super(key: key);

  final Tasks provider;
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        provider.setEditTextContainer(color);
      },
      child: CircleAvatar(
        backgroundColor: color,
        child: child,
      ),
    );
  }
}
