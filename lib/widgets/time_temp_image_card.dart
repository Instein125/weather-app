// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_app/presentation/colors_manager.dart';
import 'package:weather_app/presentation/textstyle_manager.dart';

class TimeTempImageCard extends StatelessWidget {
  TimeTempImageCard({
    Key? key,
    required this.hourlyWeatherData,
    required this.index,
    required this.currentHour,
  }) : super(key: key);

  final List hourlyWeatherData;
  int index;
  String currentHour;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 80,
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: hourlyWeatherData[index]['time'] != currentHour
            ? Colors.white38
            : Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "${hourlyWeatherData[index]['time']}:00",
            style: hourlyWeatherData[index]['time'] != currentHour
                ? getDimTextStyle(
                    color: ColorManager.lightTextColor, fontSize: 13)
                : getRegularStyle(
                    color: ColorManager.titleTextColor, fontSize: 15),
          ),
          Image.asset(
              "assets/images/${hourlyWeatherData[index]['weatherIcon']}.png"),
          Text(
            "${hourlyWeatherData[index]['temp']}°",
            style: getTempStyle(
              color: ColorManager.darkTextColor,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
