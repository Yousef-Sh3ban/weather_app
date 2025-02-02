import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HourWidget extends StatelessWidget {
  const HourWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 155,
      width: 70,
      child: Column(
        children: [
        Text(
                  "30°C",
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Expanded(child: SizedBox()),
                SvgPicture.asset("assets/icons/cloudy.svg",height: 40,width: 40,),
                Expanded(child: SizedBox()),
                Text(
                  "12:00",
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
