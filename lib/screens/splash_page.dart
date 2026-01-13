import 'package:flutter/material.dart';
import 'package:weather_app/controllers/location_controller.dart';
import 'package:weather_app/controllers/weather_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  var position = await LocationController.determinePosition();

                  WeatherController.getWeatherData(
                    latitude: position.latitude,
                    longitude: position.longitude,
                  );
                },
                child: Text('Get Location'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
