import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/data/models/city_model.dart';
import 'package:weather_app/data/network/app_end_point.dart';

class GetSearchData {
  getData(String text) async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
        AppEndPoint.searchUrl,
        queryParameters: {"key": AppEndPoint.apiKey, "q": text},
      );
      List<CityData> searchResult = List.generate(
        (response.data as List).length,
        (int index) {
          return CityData.fromJson(response.data[index]);
        },
      );
      return searchResult;
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<String> getCityWithLocation(double lat, double lon) async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
        AppEndPoint.searchUrl,
        queryParameters: {"key": AppEndPoint.apiKey, "q": "$lat,$lon"},
      );
      return CityData.fromJson(response.data[0]).name!;
    } catch (e) {
      log(e.toString());
      return "error";
    }
  }
}
