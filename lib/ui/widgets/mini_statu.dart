import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/app/functions/get_time_dif.dart';

class MiniStatu extends StatelessWidget {
  final String iconPath;
  final String name;
  final String time;
  const MiniStatu(
      {super.key,
      required this.iconPath,
      required this.name,
      required this.time,
      });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 69,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.black.withOpacity(0.3),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(90)),
                  color: Colors.black.withOpacity(0.35),
                ),
                child: Center(
                  child: SvgPicture.asset(iconPath),
                ),
              ),
            ),
            SizedBox(
              width: 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "SF Pro Display",
                      overflow: TextOverflow.clip,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  time,
                  style: TextStyle(
                      fontSize: 14,
                      overflow: TextOverflow.clip,
                      fontFamily: "SF Pro Display",
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Transform.translate(
              offset: Offset(0, -1),
              child: Text(
                getTimeDifference(time),
                style: TextStyle(
                    fontSize: 10,
                    overflow: TextOverflow.clip,
                    fontFamily: "SF Pro Display",
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
