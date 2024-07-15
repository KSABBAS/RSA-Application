import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mine/Features/Weather/WeatherModel.dart';

class WeatherService {
  String apiKey;
  WeatherService(this.apiKey);
  Future<WeatherT> getWeather(String cityName) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print("the altitude is " + position.altitude.toString());
    print("the altitude is " + position.toString());
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=${apiKey}'));
    if (response.statusCode == 200) {
      print(response.body);
      return WeatherT.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get weather data');
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    String? city = placemark[0].street;
    return city ?? "";
  }
}
