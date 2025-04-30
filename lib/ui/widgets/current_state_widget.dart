import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/app/functions/get_condation_icon.dart';
import 'package:weather_app/data/models/models.dart';

class CurrentStateWidget extends StatelessWidget {
  final Weather weatherData;
  const CurrentStateWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(child: SizedBox()),
           getConditionIcon(  
              condition: weatherData.current.condition.text,
              isDay: weatherData.current.isDay == 1,
              height: 200,
              width: 200,
            ),
            Expanded(child: SizedBox()),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${weatherData.current.tempC.toInt()}",
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
              weatherData.current.condition.text,
              style: TextStyle(
                fontFamily: "SF Pro Display",
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Text(
              "Max.:${weatherData.forecast.forecastday[0].day.maxtempC}° Min.:${weatherData.forecast.forecastday[0].day.mintempC}°",
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
                "  ${weatherData.forecast.forecastday[0].day.dailyChanceOfRain}%",
                style: TextStyle(
                  fontFamily: "SF Pro Display",
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Expanded(child: SizedBox()),
              SvgPicture.asset("assets/icons/wind_speed.svg"),
              Text(
                "  ${weatherData.current.windKph}km/h",
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
                "  ${weatherData.current.humidity}%",
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
      ],
    );
  }
}
