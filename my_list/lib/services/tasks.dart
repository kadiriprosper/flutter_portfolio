import 'package:hive/hive.dart';

part 'tasks.g.dart';

@HiveType(typeId: 1)
class Task {
  Task(
      {this.label = '',
      this.author = '',
      this.isImportant = false,
      this.isDone = false,
      this.isFavourite = false,
      this.isPlan = false}) {
    editedTime = DateTime.now();
  }
  @HiveField(0)
  String label;
  @HiveField(1)
  String author;
  @HiveField(2)
  bool isImportant;
  @HiveField(3)
  bool isPlan;
  @HiveField(4)
  bool isFavourite;
  @HiveField(5)
  bool isDone;
  @HiveField(6)
  DateTime? editedTime;
}
