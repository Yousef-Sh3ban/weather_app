import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/widgets/day_widget.dart';
import 'package:weather_app/widgets/today_widget.dart';

class WeekWidget extends StatelessWidget {
  const WeekWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: 190,
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
          SizedBox(
            height: 19,
          ),
          DayWidget(),
          SizedBox(
            height: 19,
          ),
          DayWidget(),
          SizedBox(
            height: 19,
          ),
          DayWidget(),
        ],
      ),
    );
  }
}
