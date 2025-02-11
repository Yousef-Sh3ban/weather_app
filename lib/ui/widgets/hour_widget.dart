import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/data/models/models.dart';

class HourWidget extends StatelessWidget {
  final Hour hourData;
  const HourWidget({super.key, required this.hourData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 155,
      width: 75,
      child: Column(
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
          SvgPicture.asset(
            "assets/icons/cloudy.svg",
            height: 40,
            width: 40,
          ),
          Expanded(child: SizedBox()),
          Text(
            hourData.time.substring(hourData.time.length-6),
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
