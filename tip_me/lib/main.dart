import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_me/screens/main_screen.dart';
import 'package:tip_me/services/color_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Colorizer>(
      create: (context) => Colorizer(),
      builder: (context, child) {
        return MaterialApp(
          theme: Provider.of<Colorizer>(context).mainThemeGetter,
          title: 'Tip Me',
          home: const MainScreen(),
        );
      },
    );
  }
}
