import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Monday",
          style: TextStyle(
            fontFamily: "SF Pro Display",
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        Expanded(child: SizedBox()),
        SvgPicture.asset("assets/icons/white_drops.svg"),
        Expanded(child: SizedBox()),
        Text(
          "13",
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
        Text(
          " 10",
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
    );
  }
}
