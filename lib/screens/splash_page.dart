import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weather_app/constants/app_color.dart';
import 'package:weather_app/controllers/city_controller.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:weather_app/screens/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void init() async {
    var weatherData = await WeatherController.getWeatherData();

    String cityName = weatherData['name'];
    String weatherDescription = weatherData['weather'][0]['description'];
    String image = weatherData['weather'][0]['icon'];
    double temperature = weatherData['main']['temp'];
    double mintemperature = weatherData['main']['temp_min'];
    double maxtemperature = weatherData['main']['temp_max'];
    double windSpeed = weatherData['wind']['speed'];
    int humidity = weatherData['main']['humidity'];
    int pressure = weatherData['main']['pressure'];

    List<City> cityList = await CityController.loadCities();

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            cityList: cityList,
            cityName: cityName,
            weatherDescription: weatherDescription,
            image: image,
            temperature: temperature,
            mintemperature: mintemperature,
            maxtemperature: maxtemperature,
            windSpeed: windSpeed,
            humidity: humidity,
            pressure: pressure,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Center(
              child: LoadingAnimationWidget.progressiveDots(
                color: AppColor.textColor,
                size: 70,
              ),
            ),
            SizedBox(height: 10),
            Text('Getting weather data...'),
          ],
        ),
      ),
    );
  }
}
