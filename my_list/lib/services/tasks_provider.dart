import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_list/constants/constants.dart';
import 'package:my_list/services/tasks.dart';

class Tasks extends ChangeNotifier {
  String? username = '';
  ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
  );
  Color bgColor = Colors.white54;
  Color fgColor = Colors.white;
  Color appBarColor = Colors.black;
  Color containerColor = Colors.white.withOpacity(.9);
  Color editTextContainerColor = Colors.lightBlueAccent;
  List<Task> allTasks = [];
  List<Task> importantTasks = [];
  List<Task> plannedTasks = [];
  List<Task> favTasks = [];
  List<Task> doneTasks = [];

  Future<void> initBox() async {
    await Hive.openBox(taskDb);
  }

  Future<void> closeBox() async {
    await Hive.close();
  }

  void setUsername(String un) async {
    await initBox();
    username = un;
    var box = Hive.box(taskDb);
    var taskTemp = [];
    if (box.isNotEmpty) {
      int i = 0;
      while (i < box.length) {
        taskTemp.add(box.getAt(i));
        i++;
      }
    }
    setTasks(taskTemp);
    notifyListeners();
  }

  void saveTasks(var task) async {
    await Hive.box(taskDb).add(task);
    notifyListeners();
  }

  void setTasks(List<dynamic> tasks) {
    for (var task in tasks) {
      allTasks.add(task);
      if (task.isImportant) {
        importantTasks.add(task);
      }
      if (task.isDone) {
        doneTasks.add(task);
      }
      if (task.isFavourite) {
        favTasks.add(task);
      }
      if (task.isPlan) {
        plannedTasks.add(task);
      }
    }

    notifyListeners();
  }

  void setTheme() {
    if (theme !=
        ThemeData.light()
            .copyWith(scaffoldBackgroundColor: Colors.white.withOpacity(.6))) {
      theme = ThemeData.light()
          .copyWith(scaffoldBackgroundColor: Colors.white.withOpacity(.6));
      bgColor = Colors.black54;
      fgColor = Colors.black;
      appBarColor = Colors.blue;
      containerColor = Colors.black.withOpacity(.2);
    } else {
      theme = ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      );
      bgColor = Colors.white54;
      fgColor = Colors.white;
      appBarColor = Colors.black;
      containerColor = Colors.white.withOpacity(.9);
    }
    notifyListeners();
  }

  void setDone(Task task, int index) {
    task.isDone = !task.isDone;
    if (task.isDone) {
      doneTasks.add(task);
    } else {
      doneTasks.remove(task);
    }
    updateTask(task, index);
    notifyListeners();
  }

  void setImportant(Task task, int index) {
    task.isImportant = !task.isImportant;
    if (task.isImportant) {
      importantTasks.add(task);
    } else {
      importantTasks.remove(task);
    }
    updateTask(task, index);
    notifyListeners();
  }

  void setFav(Task task, int index) {
    task.isFavourite = !task.isFavourite;
    if (task.isFavourite) {
      favTasks.add(task);
    } else {
      favTasks.remove(task);
    }
    updateTask(task, index);
    notifyListeners();
  }

  void setPlanned(Task task, int index) {
    task.isPlan = !task.isPlan;
    if (task.isPlan) {
      plannedTasks.add(task);
    } else {
      plannedTasks.remove(task);
    }
    updateTask(task, index);
    notifyListeners();
  }

  void addTask(Task task) {
    allTasks.add(task);
    task.isPlan ? plannedTasks.add(task) : null;
    task.isImportant ? importantTasks.add(task) : null;
    task.isFavourite ? favTasks.add(task) : null;
    saveTasks(task);
    notifyListeners();
  }

  void updateTask(Task task, int index) {
    Hive.box(taskDb).putAt(index, task);
    notifyListeners();
  }

  void removeTask(Task task, int index) async{
    allTasks.remove(task);
    plannedTasks.remove(task);
    importantTasks.remove(task);
    favTasks.remove(task);
    await Hive.box(taskDb).deleteAt(index);
    notifyListeners();
  }

  void resetTasks() async {
    allTasks = [];
    plannedTasks = [];
    importantTasks = [];
    favTasks = [];
    doneTasks = [];
    await closeBox();
    notifyListeners();
  }

  void setEditTextContainer(Color color) {
    editTextContainerColor = color;
    notifyListeners();
  }

  TextDecoration? isDone(Task task) {
    return task.isDone ? TextDecoration.lineThrough : null;
  }
}
