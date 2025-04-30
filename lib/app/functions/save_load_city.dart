import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveCity(String city) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString("city", city);
}

Future<String?> loadCity() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  String? cityName = pref.getString("city");
  return cityName;
}
