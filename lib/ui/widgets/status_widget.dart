import 'package:flutter/material.dart';
import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/ui/widgets/singel_statu.dart';

class StatusWidget extends StatelessWidget {
  final Weather weatherData;
  const StatusWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SingelStatu(
                iconPath: "assets/icons/uv_index.svg",
                name: "UV INDEX",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${weatherData.current.uv.round()}",
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      weatherData.current.uv.round() > 10
                          ? "Extreme"
                          : weatherData.current.uv.round() > 7
                              ? "Very High"
                              : weatherData.current.uv.round() > 5
                                  ? "High"
                                  : weatherData.current.uv.round() > 2
                                      ? "Moderate"
                                      : "Low",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 1),
                            Container(
                              height: 4,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.green,
                                    Colors.yellow,
                                    Colors.orange,
                                    Colors.red,
                                    Colors.purple,
                                  ],
                                  stops: [0.0, 0.3, 0.5, 0.7, 1.0],
                                ),
                              ),
                            ),
                            SizedBox(height: 1),
                          ],
                        ),
                        Positioned.fill(
                          child: Row(
                            children: [
                              Expanded(
                                flex: weatherData.current.uv.round(),
                                child: SizedBox(),
                              ),
                              Center(
                                child: Container(
                                  height: 6,
                                  width: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 11 - weatherData.current.uv.round(),
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 28,
            ),
            Expanded(
              child: SingelStatu(
                iconPath: "assets/icons/feels_like.svg",
                name: "FEELS LIKE",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${weatherData.current.feelslikeC.round()}°",
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      "difference from real is ${weatherData.current.feelslikeC.round()-weatherData.current.tempC.round()}°.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              child: SingelStatu(
                iconPath: "assets/icons/eye.svg",
                name: "VISIBILITY",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${weatherData.current.visKm.round()} km",
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      weatherData.current.visKm >= 1
                          ? "Safe for driving."
                          : weatherData.current.visKm >= 0.2
                              ? "Safe for driving with caution."
                              : "Not safe for driving, avoid driving unless necessary.",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 28,
            ),
            Expanded(
              child: SingelStatu(
                iconPath: "assets/icons/humidity.svg",
                name: "HUMIDITY",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${weatherData.current.humidity}%",
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      "The dew point is ${weatherData.current.windchillC.round()}° right now.",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
