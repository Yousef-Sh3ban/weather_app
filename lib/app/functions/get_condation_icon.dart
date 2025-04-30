import 'package:flutter/material.dart';

String getIconPath(String condition, bool isDay) {

  switch (condition) {
    case "Sunny": //صافي
      return isDay
          ? "assets/icons/clear_day.png"//
          : "assets/icons/clear_night.png";//

    case "Cloudy": //غائم
    case "Overcast":
      return isDay
          ? "assets/icons/cloudy_day.png"//
          : "assets/icons/cloudy_night.png";//
          
    case "Partly cloudy": //غائم خفيف
      return isDay
          ? "assets/icons/partly_cloud_day.png"//
          : "assets/icons/partly_cloud_night.png";//

    case "Heavy rain": //مطر
    case "Heavy rain at times":
    case "Torrential rain shower":
      return "assets/icons/rain.png";//
    case "Patchy rain possible": //مطر خفيف
    case "Moderate rain at times":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Light rain":
    case "Light drizzle":
    case "Patchy light rain":
    case "Patchy light drizzle":
      return "assets/icons/one_rain.png";//

    case "Blowing snow": //ثلج
    case "Heavy snow":
    case "Moderate or heavy sleet showers":
    case "Moderate or heavy snow showers":
    case "Moderate or heavy showers of ice pellets":
    case "Ice pellets":
    case "Moderate snow":
    case "Moderate or heavy sleet":
    case "Blizzard":
      return "assets/icons/snow.png";//
    case "Patchy snow possible": //ثلج خفيف
    case "Patchy sleet possible":
    case "Light sleet":
    case "Light showers of ice pellets":
    case "Light sleet showers":
    case "Light snow showers":
    case "Light snow":
    case "Heavy freezing drizzle":
    case "Patchy freezing drizzle possible":
    case "Freezing drizzle":
      return "assets/icons/one_snow.png";//

    case "Thundery outbreaks possible": //برق
            return isDay
          ? "assets/icons/thunder_day.png"//
          : "assets/icons/thunder_night.png";//
      
    case "Mist": //ضباب
    case "Fog":
    case "Freezing fog":
      return "assets/icons/foggy.png";//

    case "Patchy light rain with thunder": //برق و مطر
    case "Moderate or heavy rain with thunder":
      return isDay
          ? "assets/icons/thunder_rain_day.png"//
          : "assets/icons/thunder_rain_night.png";//
    case "Patchy light snow with thunder": //برق و ثلج
    case "Moderate or heavy snow with thunder":
      return isDay
          ? "assets/icons/thunder_snow_day.png"//
          : "assets/icons/thunder_snow_night.png";//

    default:
      return "assets/icons/clear_day.png";//
  }
}

Widget getConditionIcon(
    {required String condition,
    required bool isDay,
    required double height,
    required double width}) {
  return Image.asset(
    getIconPath(condition, isDay),
    height: height,
    width: width,
  );
}
