import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_list/components/bottom_sheet_container.dart';
import 'package:my_list/components/custom_appbar.dart';
import 'package:my_list/components/tasks_list_view.dart';
import 'package:my_list/services/tasks_provider.dart';
import 'package:provider/provider.dart';

class ImportantTaskScreen extends StatefulWidget {
  const ImportantTaskScreen({Key? key}) : super(key: key);

  @override
  State<ImportantTaskScreen> createState() => _ImportantTaskScreenState();
}

class _ImportantTaskScreenState extends State<ImportantTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Tasks>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        label: 'Important',
      ).build(context),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: provider.importantTasks.isNotEmpty
                    ? TasksList(
                        provider: provider,
                        tasks: Provider.of<Tasks>(context).importantTasks,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.briefcase_fill,
                            color: Colors.lightBlueAccent.shade700,
                            size: 60,
                          ),
                          const Center(
                            child: Text(
                              'No Important Task Yet',
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
                  isImportant: true,
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
