import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/widgets/today_widget.dart';
import 'package:weather_app/widgets/week_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF08244F), // 0%
            Color(0xFF134CBF), // 47%
            Color(0xFF0842AB), // 100%
          ],
          stops: [0.0, 0.47, 1.0], // Corresponding stops
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/icons/location.svg"),
                  Expanded(child: SizedBox()),
                  Text(
                    "Mansoura",
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  SvgPicture.asset("assets/icons/search.svg"),
                ],
              ),
              Image.asset(
                "assets/icons/rain2.png",
                height: 200,
                width: 200,
              ),
              SizedBox(
                height: 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    " 30°",
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 64,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Precipitations",
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Max.:34° Min.:28°",
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 31,
              ),
              Container(
                height: 47,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    SvgPicture.asset("assets/icons/white_drops.svg"),
                    Text(
                      "  6%",
                      style: TextStyle(
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    SvgPicture.asset("assets/icons/wind.svg"),
                    Text(
                      "  19km/h",
                      style: TextStyle(
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    SvgPicture.asset("assets/icons/temp.svg"),
                    Text(
                      "  90%",
                      style: TextStyle(
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TodayWidget(),
              SizedBox(
                height: 20,
              ),
              WeekWidget()
            ],
          ),
        ),
      ),
    );
  }
}
