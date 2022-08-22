import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_list/components/custom_appbar.dart';
import 'package:my_list/components/tasks_list_view.dart';
import 'package:my_list/services/tasks_provider.dart';
import 'package:provider/provider.dart';

class DoneTaskScreen extends StatefulWidget {
  const DoneTaskScreen({Key? key}) : super(key: key);

  @override
  State<DoneTaskScreen> createState() => _DoneTaskScreenState();
}

class _DoneTaskScreenState extends State<DoneTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Tasks>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        label: 'Finished Tasks',
        splashColor: Colors.blue,
      ).build(context),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: provider.doneTasks.isNotEmpty
                    ? TasksList(
                        provider: provider,
                        tasks: Provider.of<Tasks>(context).doneTasks,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.flag_slash_fill,
                            size: 50,
                            color: Colors.lightBlueAccent.shade700,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Center(
                            child: Text(
                              'No Finished Task Yet',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
