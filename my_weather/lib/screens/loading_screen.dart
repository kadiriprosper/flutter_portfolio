import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_weather/api.dart';
import 'package:my_weather/constants/constants.dart';
import 'package:my_weather/services/location_helper.dart';
import 'package:my_weather/services/network_weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getWeatherData();
    super.initState();
  }

  void getWeatherData() async {
    LocationHelper locationHelper = LocationHelper();
    await locationHelper.getLocation();
    double? long = locationHelper.long;
    double? lat = locationHelper.lat;
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$api&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url, context);
    await networkHelper.getData();
    navigateScreen();
  }

  void navigateScreen() {
    Navigator.of(context).popAndPushNamed(weatherPage);
  }

  @override
  Widget build(BuildContext context) {
    return const SpinKitHourGlass(
      color: Colors.white,
    );
  }
}
