import 'package:flutter/material.dart';
import 'package:mine/Features/Weather/Weather.dart';
import 'package:mine/Features/Weather/WeatherModel.dart';
import 'package:mine/Features/Weather/service.dart';
import 'package:mine/SplashViewPage.dart';

class Weatherinfohandling {
  WeatherT? waether;
  final _weatherService = WeatherService("85ed5a14e6df1f0ae67a7efcd16b058a");
  fetchWeather() async {
    String _cityName = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.getWeather(_cityName);
      this.waether = weather;
    } catch (e) {
      print(e);
    }
    LittleDone = true;
    done = true;
  }

  String WeatherAnimation(String? Condition) {
    switch (Condition?.toLowerCase()) {
      case "clouds":
      case "mist":
      case "smoke":
      case "haze":
      case "dust":
      case "fog":
        return "cloudy";
      case "rain":
      case "drizzle":
      case "shower rain":
        return "rain";
      case "thunderstorm":
        return "thunderstorm";
      case "clear":
        return "sunny";
      default:
        return "sunny";
    }
  }
}
