import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'weather_data.dart';

class NetworkHelper {
  NetworkHelper(this.url, this.context);
  String url;
  BuildContext context;

  Future getData() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      await updateProvider(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  Future updateProvider(dynamic response) async {
    final provider = Provider.of<WeatherData>(context, listen: false);
    var maxTemp = response['main']['temp_max'];
    var temp = response['main']['temp'];
    var minTemp = response['main']['temp_min'];
    var windSpeed = response['wind']['speed'];
    int pressure = response['main']['pressure'];
    int humidity = response['main']['humidity'];
    String location = response['name'];
    String weatherStatus = response['weather'][0]['description'];
    String? country = response['sys']['country'];
    provider.setData(
      maxTemp,
      minTemp,
      temp.toInt(),
      windSpeed,
      pressure,
      humidity,
      location,
      weatherStatus,
      country ?? 'null',
    );
  }
}
