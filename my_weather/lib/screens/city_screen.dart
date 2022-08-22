import 'package:flutter/material.dart';
import 'package:my_weather/api.dart';
import 'package:my_weather/services/network_weather.dart';
import 'package:my_weather/services/weather_data.dart';
import 'package:provider/provider.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? input;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/cloudy.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 80, left: 20, right: 20, bottom: 8),
              child: TextField(
                onChanged: (value) {
                  input = value;
                },
                decoration: InputDecoration(
                  hintText: "e.g 'london', 'lagos'",
                  hintStyle: const TextStyle(color: Colors.white),
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  labelText: 'City Name',
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.only(right: 20),
                width: 140,
                child: MaterialButton(
                  shape: Border.all(width: 2, color: Colors.white30),
                  elevation: 5,
                  splashColor: Colors.yellow,
                  height: 50,
                  visualDensity: VisualDensity.comfortable,
                  color: Colors.blue,
                  onPressed: () async {
                    if (input != null) {
                      Provider.of<WeatherData>(context, listen: false).setUrl(
                          'https://api.openweathermap.org/data/2.5/weather?q=$input&appid=$api&units=metric');
                      NetworkHelper networkHelper = NetworkHelper(
                          Provider.of<WeatherData>(context, listen: false).url!,
                          context);
                      await networkHelper.getData();
                      gotoWeatherScreen();
                    }
                  },
                  child: const Center(
                    child: Text('Get Weather'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void gotoWeatherScreen() {
    Navigator.pop(context);
  }
}
