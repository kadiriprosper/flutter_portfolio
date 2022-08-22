import 'package:flutter/material.dart';
import 'package:my_list/components/bottom_sheet_container.dart';
import 'package:my_list/components/custom_appbar.dart';
import 'package:my_list/components/tasks_list_view.dart';
import 'package:my_list/services/tasks_provider.dart';
import 'package:provider/provider.dart';

class FavTaskScreen extends StatefulWidget {
  const FavTaskScreen({Key? key}) : super(key: key);

  @override
  State<FavTaskScreen> createState() => _FavTaskScreenState();
}

class _FavTaskScreenState extends State<FavTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Tasks>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        label: 'Favourites',
        splashColor: Colors.pink,
      ).build(context),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: provider.favTasks.isNotEmpty
                    ? TasksList(
                        provider: provider,
                        tasks: Provider.of<Tasks>(context).favTasks,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.heart_broken,
                            color: Colors.pink.shade800,
                            size: 60,
                          ),
                          const Center(
                            child: Text(
                              'No Favourite Task Yet',
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
                  isFav: true,
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
