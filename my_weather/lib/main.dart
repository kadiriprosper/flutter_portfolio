import 'package:flutter/material.dart';
import 'package:my_weather/constants/constants.dart';
import 'package:my_weather/screens/city_screen.dart';
import 'package:my_weather/screens/loading_screen.dart';
import 'package:my_weather/screens/weather_screen.dart';
import 'package:my_weather/services/weather_data.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WeatherData>(
      create: (context) => WeatherData(),
      child: MaterialApp(
        title: 'My Weather',
        initialRoute: loadingPage,
        routes: {
          loadingPage: (context) => const LoadingScreen(),
          weatherPage: (context) => const WeatherScreen(),
          cityPage: (context) => const CityScreen(),
        },
      ),
    );
  }
}
