import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/app/functions/get_condation_icon.dart';
import 'package:weather_app/data/models/models.dart';

class HourWidget extends StatelessWidget {
  final Hour hourData;
  const HourWidget({super.key, required this.hourData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      height: 155,
      width: 75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${hourData.tempC.toInt()}°C",
            style: TextStyle(
              fontFamily: "SF Pro Display",
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Expanded(child: SizedBox()),
          getConditionIcon(  
              condition: hourData.condition.text,
              isDay: hourData.isDay== 1,
              height: 40,
              width: 40,
          ),
          //  SvgPicture.asset(
          //   "assets/icons/cloudy.svg",
          //   height: 40,
          //   width: 40,
          // ),
          Expanded(child: SizedBox()),
          Text(
            hourData.time.substring(hourData.time.length - 5),
            style: TextStyle(
              fontFamily: "SF Pro Display",
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
