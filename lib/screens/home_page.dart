import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_color.dart';
import 'package:weather_app/widgets/decorated_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            spacing: 10,
            children: [
              SearchBar(
                elevation: WidgetStatePropertyAll(0),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
                hintText: 'London',
                hintStyle: WidgetStatePropertyAll(
                  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyColor,
                  ),
                ),
                trailing: [
                  DecoratedContainer(
                    padding: EdgeInsetsGeometry.all(8),
                    child: Icon(Icons.search, color: AppColor.textColor),
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: .center,
                  spacing: 20,
                  children: [
                    Text(
                      'London',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: AppColor.textColor,
                      ),
                    ),
                    Text(
                      'Cloudy',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColor.textColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 5, child: Image.asset('assets/images/cloudy.png')),
              DecoratedContainer(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      '50°',
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
                          TextSpan(text: '23°'),
                          TextSpan(text: '  '),
                          TextSpan(
                            text: '19°',
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
                            '06 km/h',
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
                            '22%',
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
                          Icon(Icons.beach_access, color: AppColor.greyColor),
                          Text(
                            '11%',
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
