import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/data/models/models.dart';
import 'package:intl/intl.dart';

class DayWidget extends StatelessWidget {
  final Forecastday forecastday;
  const DayWidget({super.key, required this.forecastday});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Text(
              DateFormat('EEEE').format(forecastday.date!),
              style: TextStyle(
                fontFamily: "SF Pro Display",
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            Expanded(child: SizedBox()),
            Text(
              forecastday.day.maxtempC.toInt().toString(),
              style: TextStyle(
                fontFamily: "SF Pro Display",
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            Transform.translate(
              offset: Offset(0, -4),
              child: Text(
                "°C ",
                style: TextStyle(
                  fontFamily: "SF Pro Display",
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              forecastday.day.mintempC.toInt().toString(),
              style: TextStyle(
                fontFamily: "SF Pro Display",
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
                color: Color.fromRGBO(255, 255, 255, 0.5),
                fontSize: 16,
              ),
            ),
            Transform.translate(
              offset: Offset(0, -4),
              child: Text(
                "°C",
                style: TextStyle(
                  fontFamily: "SF Pro Display",
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontSize: 10,
                ),
              ),
            )
          ],
        ),
        Center(
          child: SvgPicture.asset("assets/icons/white_drops.svg"),
        ),
        Positioned(
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/icons/white_drops.svg")),
      ],
    );
  }
}
