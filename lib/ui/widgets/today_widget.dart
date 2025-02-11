import 'package:flutter/material.dart';
import 'package:weather_app/app/num_to_month.dart';
import 'package:weather_app/data/models/models.dart';
import 'hour_widget.dart';

class TodayWidget extends StatelessWidget {
  final Weather weatherData;
  const TodayWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: 217,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.black.withOpacity(0.3),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Today",
                style: TextStyle(
                  fontFamily: "SF Pro Display",
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Expanded(child: SizedBox()),
              Text(
                "${numToMonth(weatherData.forecast.forecastday[0].date!.month)}, ${weatherData.forecast.forecastday[0].date!.day}",
                style: TextStyle(
                  fontFamily: "SF Pro Display",
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 18,
                ),
              )
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  List.generate(weatherData.forecast.forecastday[0].hour.length,
                      (int inedex) {
                return HourWidget(
                  hourData: weatherData.forecast.forecastday[0].hour[inedex],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
