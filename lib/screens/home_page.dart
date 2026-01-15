import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_color.dart';
import 'package:weather_app/controllers/city_controller.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:weather_app/widgets/decorated_container.dart';

class HomePage extends StatefulWidget {
  final List<City> cityList;
  final String cityName;
  final String weatherDescription;
  final String image;
  final double temperature;
  final double mintemperature;
  final double maxtemperature;
  final double windSpeed;
  final int humidity;
  final int pressure;

  const HomePage({
    required this.cityList,
    required this.cityName,
    required this.weatherDescription,
    required this.image,
    required this.temperature,
    required this.mintemperature,
    required this.maxtemperature,
    required this.windSpeed,
    required this.humidity,
    required this.pressure,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String cityName;
  late String weatherDescription;
  late String image;
  late dynamic temperature;
  late dynamic minTemperature;
  late dynamic maxTemperature;
  late dynamic windSpeed;
  late int humidity;
  late int pressure;

  @override
  void initState() {
    super.initState();
    cityName = widget.cityName;
    weatherDescription = widget.weatherDescription;
    image = widget.image;
    temperature = widget.temperature;
    minTemperature = widget.mintemperature;
    maxTemperature = widget.maxtemperature;
    windSpeed = widget.windSpeed;
    humidity = widget.humidity;
    pressure = widget.pressure;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            spacing: 10,
            children: [
              SearchAnchor(
                builder: (context, controller) {
                  return SearchBar(
                    controller: controller,
                    elevation: const WidgetStatePropertyAll(0),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    hintText: 'Search city',
                    hintStyle: WidgetStatePropertyAll(
                      TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.greyColor,
                      ),
                    ),
                    trailing: [
                      DecoratedContainer(
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.search),
                      ),
                    ],
                    onChanged: (_) => controller.openView(),
                    onSubmitted: (value) async {
                      var weatherData =
                          await WeatherController.getWeatherDataFromCityName(
                            cityName: value.trim(),
                          );
                      setState(() {
                        cityName = weatherData['name'];
                        weatherDescription =
                            weatherData['weather'][0]['description'];
                        image = weatherData['weather'][0]['icon'];
                        temperature = weatherData['main']['temp'];
                        minTemperature = weatherData['main']['temp_min'];
                        maxTemperature = weatherData['main']['temp_max'];
                        windSpeed = weatherData['wind']['speed'];
                        humidity = weatherData['main']['humidity'];
                        pressure = weatherData['main']['pressure'];
                      });
                      print('submitted');
                    },
                  );
                },

                suggestionsBuilder: (context, controller) {
                  final query = controller.text.toLowerCase();

                  final results = widget.cityList
                      .where((city) => city.name.toLowerCase().contains(query))
                      .take(10)
                      .toList();

                  return results.map((city) {
                    return ListTile(
                      title: Text(city.name),
                      subtitle: Text(city.country),
                      onTap: () async {
                        controller.closeView(city.name);
                        var weatherData =
                            await WeatherController.getWeatherDataFromCityName(
                              cityName: city.name,
                            );
                        setState(() {
                          cityName = weatherData['name'];
                          weatherDescription =
                              weatherData['weather'][0]['description'];
                          image = weatherData['weather'][0]['icon'];
                          temperature = weatherData['main']['temp'];
                          minTemperature = weatherData['main']['temp_min'];
                          maxTemperature = weatherData['main']['temp_max'];
                          windSpeed = weatherData['wind']['speed'];
                          humidity = weatherData['main']['humidity'];
                          pressure = weatherData['main']['pressure'];
                        });
                        print('sugesstion');
                      },
                    );
                  });
                },
              ),

              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: .center,
                  spacing: 20,
                  children: [
                    Text(
                      cityName,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: AppColor.textColor,
                      ),
                    ),
                    Text(
                      weatherDescription.toTitleCase(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColor.textColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Image.network(
                  'https://openweathermap.org/img/wn/$image@4x.png',
                  scale: 0.6,
                ),
              ),
              DecoratedContainer(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      '${temperature.toStringAsFixed(1)}°',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w500,
                        color: AppColor.textColor,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: '${maxTemperature.toStringAsFixed(1)}°',
                          ),
                          TextSpan(text: '  '),
                          TextSpan(
                            text: '${minTemperature.toStringAsFixed(1)}°',
                            style: TextStyle(color: AppColor.greyColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: DecoratedContainer(
                      child: Column(
                        spacing: 5,
                        children: [
                          Icon(Icons.air, color: AppColor.greyColor),
                          Text(
                            '$windSpeed km/h',
                            style: TextStyle(
                              color: AppColor.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: DecoratedContainer(
                      child: Column(
                        spacing: 5,
                        children: [
                          Icon(Icons.water_drop, color: AppColor.greyColor),
                          Text(
                            '$humidity%',
                            style: TextStyle(
                              color: AppColor.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: DecoratedContainer(
                      child: Column(
                        spacing: 5,
                        children: [
                          Icon(
                            Icons.device_thermostat,
                            color: AppColor.greyColor,
                          ),
                          Text(
                            '$pressure hPa',
                            style: TextStyle(
                              color: AppColor.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
