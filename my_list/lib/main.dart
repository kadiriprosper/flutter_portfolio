import 'package:flutter/material.dart';
import 'package:my_list/constants/constants.dart';
import 'package:my_list/screens/done_tasks_screen.dart';
import 'package:my_list/screens/entry_page.dart';
import 'package:my_list/screens/fav_tasks_sceen.dart';
import 'package:my_list/screens/important_tasks.dart';
import 'package:my_list/screens/login_sceen.dart';
import 'package:my_list/screens/main_screen.dart';
import 'package:my_list/screens/plan_screen.dart';
import 'package:my_list/screens/registration_page.dart';
import 'package:hive/hive.dart';
import 'package:my_list/services/tasks.dart';
import 'package:my_list/services/tasks_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDirectory = await getApplicationDocumentsDirectory();
  Hive.registerAdapter<Task>(TaskAdapter());
  Hive.init(appDirectory.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Tasks(),
      builder: (context, child) => MaterialApp(
        theme: Provider.of<Tasks>(context).theme,
        routes: {
          loginPage: (context) => const LoginScreen(),
          mainPage: (context) => const MainScreen(),
          importantPage: (context) => const ImportantTaskScreen(),
          planTaskPage: (context) => const PlanTaskScreen(),
          donePage: (context) => const DoneTaskScreen(),
          favPage: (context) => const FavTaskScreen(),
          regPage: (context) => const RegistrationScreen(),
          entryPage: (context) => const EntryScreen(),
          //taskScreen: (context) => const TaskScren(),
        },
        initialRoute: entryPage,
      ),
    );
  }
}
