import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/data/network/app_end_point.dart';
import 'package:weather_app/data/models/models.dart';

class GetWeatherData {
  getData(String city) async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
        AppEndPoint.forecastUrl,
        queryParameters: {"key": AppEndPoint.apiKey, "q": city, "days": 3},
      );
      Weather weatherData=Weather.fromJson(response.data);
      return weatherData;
    } catch (e) {
      log(e.toString());
    }
  }
}
