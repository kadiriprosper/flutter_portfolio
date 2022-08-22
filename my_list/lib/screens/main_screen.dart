import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_list/components/bottom_sheet_container.dart';
import 'package:my_list/components/custom_appbar.dart';
import 'package:my_list/components/icon_row_button.dart';
import 'package:my_list/components/tasks_list_view.dart';
import 'package:my_list/constants/constants.dart';
import 'package:my_list/services/tasks_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Tasks>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        label: 'Tasks',
        backEnabled: false,
      ).build(context),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconRowButton(
              iconColor: Colors.red,
              icon: Icons.favorite_outline_rounded,
              label: 'Favourites',
              onTap: () {
                Navigator.of(context).pushNamed(favPage);
              },
              tasksLength: provider.favTasks.length,
            ),
            IconRowButton(
              iconColor: Colors.yellow,
              label: 'Plans',
              icon: Icons.lightbulb_outline_rounded,
              onTap: () {
                Navigator.of(context).pushNamed(planTaskPage);
              },
              tasksLength: provider.plannedTasks.length,
            ),
            IconRowButton(
              iconColor: Colors.blue,
              label: 'Important',
              icon: Icons.label_important_outline_rounded,
              onTap: () {
                Navigator.of(context).pushNamed(importantPage);
              },
              tasksLength: provider.importantTasks.length,
            ),
            IconRowButton(
              iconColor: Colors.blue,
              label: 'Done',
              icon: Icons.check_box_outlined,
              onTap: () {
                Navigator.of(context).pushNamed(donePage);
              },
              tasksLength: provider.doneTasks.length,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Divider(
                color: Colors.lightBlueAccent,
                thickness: 1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Divider(
                color: Colors.lightBlueAccent,
                thickness: 1,
              ),
            ),
            Expanded(
              child: Container(
                child: provider.allTasks.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.pencil_outline,
                            color: Colors.lightBlueAccent.shade700,
                            size: 50,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Nothing Yet',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      )
                    : SizedBox(
                        child: TasksList(
                          provider: provider,
                          tasks: provider.allTasks,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            //isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: BottomSheetContainer(provider: provider));
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
