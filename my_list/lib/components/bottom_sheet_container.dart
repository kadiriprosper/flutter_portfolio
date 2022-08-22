import 'package:flutter/material.dart';
import 'package:my_list/constants/constants.dart';
import 'package:my_list/services/tasks.dart';
import 'package:my_list/services/tasks_provider.dart';

class BottomSheetContainer extends StatefulWidget {
  const BottomSheetContainer({
    Key? key,
    required this.provider,
    this.isFav = false,
    this.isImportant = false,
    this.isPlanned = false,
  }) : super(key: key);

  final Tasks provider;
  final bool isFav;
  final bool isImportant;
  final bool isPlanned;

  @override
  State<BottomSheetContainer> createState() => _BottomSheetContainerState();
}

class _BottomSheetContainerState extends State<BottomSheetContainer> {
  String? task;
  late bool isFav;
  late bool isImportant;
  late bool isPlanned;
  @override
  void initState() {
    isFav = widget.isFav;
    isImportant = widget.isImportant;
    isPlanned = widget.isPlanned;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        //height: 100,
        width: 250,
        decoration: BoxDecoration(
          color: widget.provider.containerColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.lightBlueAccent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            TextField(
              maxLines: 3,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black),
              onChanged: (value) {
                task = value;
              },
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFav = !isFav;
                          });
                        },
                        icon: isFav
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
                          setState(() {
                            isPlanned = !isPlanned;
                          });
                        },
                        icon: isPlanned
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
                          setState(() {
                            isImportant = !isImportant;
                          });
                        },
                        icon: isImportant
                            ? const Icon(
                                Icons.label_important_rounded,
                                color: Colors.blue,
                              )
                            : const Icon(Icons.label_important_outline_rounded),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (task!.isNotEmpty && task != null) {
                      Task newTask = Task(
                        label: task!,
                        author: widget.provider.username!,
                        isFavourite: isFav,
                        isImportant: isImportant,
                        isPlan: isPlanned,
                      );
                      widget.provider.addTask(newTask);
                      Navigator.of(context).pop();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Text(
                        'Push Task',
                        style: textStyle1.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
