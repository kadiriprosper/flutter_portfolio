import 'package:flutter/material.dart';

// Hive Boxes
const String taskBox = 'TASK BOX';
const String taskDb = 'TASK DB';

// Routes
const String mainPage = 'MAIN SCREEN';
const String importantPage = 'IMPORTANT TASK SCREEN';
const String planTaskPage = 'PLAN TASK SCREEN';
const String loginPage = 'LOGIN SCREEN';
const String donePage = 'DONE TASK SCREEN';
const String favPage = 'DONE FAV SCREEN';
const String regPage = 'REGISTRATION PAGE';
const String entryPage = 'ENTRY PAGE';
const String logoID = 'HERO LOGO';
const String taskScreen = 'TASK SCREEN';

//design constants
final inputDesign1 = InputDecoration(
  labelStyle: const TextStyle(color: Colors.black54),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      width: 1.5,
      color: Colors.blue,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      width: 1.5,
      color: Colors.blue,
    ),
  ),
);

final textStyle1 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w300,
  color: Colors.blue.shade900,
);

//months
enum Months {
  jan,
  feb,
  march,
  apr,
  may,
  jun,
  jul,
  aug,
  sept,
  oct,
  nov,
  dec,
}
