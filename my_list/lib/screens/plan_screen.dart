import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_list/components/bottom_sheet_container.dart';
import 'package:my_list/components/custom_appbar.dart';
import 'package:my_list/components/tasks_list_view.dart';
import 'package:my_list/services/tasks_provider.dart';
import 'package:provider/provider.dart';

class PlanTaskScreen extends StatefulWidget {
  const PlanTaskScreen({Key? key}) : super(key: key);

  @override
  State<PlanTaskScreen> createState() => _PlanTaskScreenState();
}

class _PlanTaskScreenState extends State<PlanTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Tasks>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        label: 'Plans',
        splashColor: Colors.yellow,
      ).build(context),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: provider.plannedTasks.isNotEmpty
                    ? TasksList(
                        provider: provider,
                        tasks: Provider.of<Tasks>(context).plannedTasks,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.lightbulb_slash_fill,
                            color: Colors.yellow.shade800,
                            size: 50,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Center(
                            child: Text(
                              'No Planned Task Yet',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: BottomSheetContainer(
                  provider: provider,
                  isPlanned: true,
                ),
              );
            },
          );
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.pink.shade900,
        child: const Icon(Icons.note_add),
      ),
    );
  }
}
