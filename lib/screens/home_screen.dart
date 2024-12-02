import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../models/weather_model.dart';
import '../services/weather_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  String getWeatherAnimation(String? mainCondition) {
    if(mainCondition == null) return 'assets/snow.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return 'assets/rain.json';
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
      return 'assets/snow.json';
      case 'rain':
        return 'assets/rain.json';
      case 'snow':
      case 'drizzle':
        return 'assets/rain.json';
      case 'clear':
      return 'assets/sunny.json';
      case 'sunny':
        return 'assets/sunny.json';
      default:
        return 'assets/snow.json';
    }
  }

  // init state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1D2647),Color(0xFF8B4BAC)])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * .2),
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition), height: 200, width: 200, alignment: Alignment.topCenter),
            SizedBox(height: height * .02),
            Text('${_weather?.temp.round()} °C' , style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 48, color: Colors.white),),
            SizedBox(height: height * .02),
            Text('Preciitations', style: GoogleFonts.poppins(
              fontSize: 16,  color: Colors.white
            ),),
            SizedBox(height: height * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Max: ${_weather?.temp_max.round()} °C', style: GoogleFonts.poppins(
              fontSize: 16,  color: Colors.white
            ),),
                SizedBox(width: width * .02),
                Text('Min: ${_weather?.temp_min.round()} °C', style: GoogleFonts.poppins(
              fontSize: 16,  color: Colors.white
            ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
