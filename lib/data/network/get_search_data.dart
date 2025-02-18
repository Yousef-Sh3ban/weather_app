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
          log(CityData.fromJson(response.data[index]).name!);
          return CityData.fromJson(response.data[index]);
        },
      );
      return searchResult;
    } catch (e) {
      log(e.toString());
    }
  }
}
