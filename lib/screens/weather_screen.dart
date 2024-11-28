import 'package:flutter/material.dart';
import 'package:weather/services/weather_service.dart';

import '../models/weather_model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  // api key
  final _weatherService = WeatherService('10514a4bf4b8452dd0b7ba342adb286d');
  Weather? _weather;

  // fetch weather
  _fetchWeather() async{
  //   get the current city
    String cityName = await _weatherService.getCurrentCity();

  //   get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }
  //   any errors
    catch (e) {
      print(e);
    }
  }
  // weather animation

  // init state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // city name
            Text(_weather?.cityName ?? "loadting city..."),
          //   temparature
            Text('${_weather?.temp.round()} c'),
          //   condition
            Text(_weather?.mainCondition ?? 'loadtion condition'),
            Text(_weather?.timezone ?? '00'),
            Text('Wind speed ${_weather?.windSpeed}')
          ],
        ),
      ),
    );
  }
}
