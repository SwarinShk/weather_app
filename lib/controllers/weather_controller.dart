import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class WeatherController {
  static getWeatherData({
    required double latitude,
    required double longitude,
  }) async {
    var uri = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=${dotenv.env['openweatherapi']}&units=metric',
    );
    http.Response response = await http.get(uri);
    print(response.body);

    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse['sys']['country']);
  }
}
