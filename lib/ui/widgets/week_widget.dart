import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/data/models/models.dart';
import 'day_widget.dart';

class WeekWidget extends StatelessWidget {
  final Forecast forecast;
  const WeekWidget({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: 130,
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
                "Next Forecast",
                style: TextStyle(
                  fontFamily: "SF Pro Display",
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Expanded(child: SizedBox()),
              SvgPicture.asset("assets/icons/calendar.svg"),
            ],
          ),
          SizedBox(height: 19,),
          Column(
            spacing: 19,
            children: List.generate(
              forecast.forecastday.length-1,
              (int index) {
                return DayWidget(
                  forecastday: forecast.forecastday[index+1],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
