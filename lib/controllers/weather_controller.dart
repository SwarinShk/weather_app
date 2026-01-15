import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/controllers/location_controller.dart';

class WeatherController {
  static Future<Map<String, dynamic>> getWeatherData() async {
    try {
      var position = await LocationController.determinePosition();

      var uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=${dotenv.env['openweatherapi']}&units=metric',
      );
      http.Response response = await http.get(uri);

      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      // print(response.body);
      return decodedResponse;
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Map<String, dynamic>> getWeatherDataFromCityName({
    required String cityName,
  }) async {
    try {
      var uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=${dotenv.env['openweatherapi']}&units=metric',
      );
      http.Response response = await http.get(uri);

      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      print(response.body);
      return decodedResponse;
    } catch (e) {
      return Future.error(e);
    }
  }
}
