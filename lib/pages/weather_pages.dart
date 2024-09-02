import 'package:flutter/material.dart';
import 'package:weather_application/services/weather_services.dart';

import '../models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //api key
  final _weatherService = WeatherService("d68fcb405b46802357f905b1b36d6626");
  Weather? _weather;

  //fetch weather
  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }

  //weather animations
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //city name
          Text(_weather?.cityName ?? "Loading city.."),

          // temperature
          Text('${_weather?.temperature.round()}°C')
        ],
      ),
    );
  }
}
