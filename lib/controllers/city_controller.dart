import 'dart:convert';
import 'package:flutter/services.dart';

class CityController {
  static Future<List<City>> loadCities() async {
    final jsonString = await rootBundle.loadString('assets/citylist.json');
    final List data = jsonDecode(jsonString);
    return data.map((e) => City.fromJson(e)).toList();
  }
}

class City {
  dynamic id;
  String name;
  String state;
  String country;

  City({
    required this.id,
    required this.name,
    required this.state,
    required this.country,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      country: json['country'],
      state: json['state'],
    );
  }
}
