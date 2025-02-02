import 'package:flutter/material.dart';
import 'package:weather_app/widgets/hour_widget.dart';

class TodayWidget extends StatelessWidget {
  const TodayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12) ,
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
                "Mar, 9",
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
            child: Row(children: [
              HourWidget(),
              HourWidget(),
              HourWidget(),
              HourWidget(),
              HourWidget(),
            ],),
          )
        ],
      ),
    );
  }
}
