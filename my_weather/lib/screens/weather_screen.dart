import 'package:flutter/material.dart';
import 'package:my_weather/services/weather_data.dart';
import 'package:provider/provider.dart';
import 'package:my_weather/constants/constants.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/rainy1.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.srgbToLinearGamma(),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 15,
              child: InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, loadingPage);
                },
                child: const Icon(
                  (Icons.home),
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 5,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(cityPage);
                },
                child: const Icon(
                  Icons.navigation_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Positioned(
              top: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${Provider.of<WeatherData>(context).location}, ${Provider.of<WeatherData>(context).country}',
                    style: textStyle1.copyWith(
                      color: Colors.white.withOpacity(.85),
                    ),
                  ),
                  Text(
                    '${Provider.of<WeatherData>(context).temp}°c',
                    style: bigTextStyle1.copyWith(
                      color: Provider.of<WeatherData>(context).temperatureColor,
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_drop_up_sharp,
                          color: Colors.pink.shade900,
                          size: 50,
                        ),
                        Text(
                          '${Provider.of<WeatherData>(context).maxTemp.toStringAsFixed(2)}°c',
                          style: textStyle2.copyWith(
                              color: Colors.orange.shade200),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.blue,
                          size: 50,
                        ),
                        Text(
                          '${Provider.of<WeatherData>(context).minTemp.toStringAsFixed(2)}°c',
                          style: textStyle2.copyWith(
                              color: Colors.blueAccent.shade700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 100,
              right: 10,
              child: RotatedBox(
                quarterTurns: 1,
                child: Text(
                  Provider.of<WeatherData>(context).weatherStatus,
                  style: textStyle1.copyWith(
                    color: Colors.white.withOpacity(.9),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                height: 83,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  border:
                      Border.all(color: Colors.blueAccent.shade100, width: 2.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Wind Speed',
                          style: textStyle3,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${Provider.of<WeatherData>(context).windSpeed.toStringAsFixed(2)} m/s',
                          style: textStyle3,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'Pressure',
                          style: textStyle3,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${Provider.of<WeatherData>(context).pressure} pa',
                          style: textStyle3,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'Humidity',
                          style: textStyle3,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${Provider.of<WeatherData>(context).humidity} g/kg',
                          style: textStyle3,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
