import 'package:flutter/material.dart';

class WeatherData extends ChangeNotifier {
  var minTemp;
  var maxTemp;
  var temp = 0;
  double windSpeed = 0;
  int pressure = 0;
  int humidity = 0;
  Color temperatureColor = Colors.blue;
  String location = 'No Location';
  String weatherStatus = 'No Weather';
  String? url;
  String? country;

  void setUrl(String uri) {
    url = uri;
    notifyListeners();
  }

  void setLocation() async {}

  void setData(
    var mT,
    var mt,
    var t,
    double wS,
    int p,
    int h,
    String l,
    String ws,
    String country,
  ) {
    maxTemp = mT;
    minTemp = mt;
    temp = t;
    windSpeed = wS;
    pressure = p;
    humidity = h;
    location = l;
    weatherStatus = ws;
    this.country = country;
    if (t < 25) {
      temperatureColor = Colors.blue;
    } else {
      temperatureColor = Colors.orange;
    }
    notifyListeners();
  }
}
