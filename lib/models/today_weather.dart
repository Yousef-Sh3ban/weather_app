class TodayWeather {
  String name;
  int temp;
  int feelslike_c;
  bool isDay;
  String conditionText;
  String conditionIcon;
  double wind_kph;
  int humidity;
  int uv;
}
class Dayweather{
  String date;
  String name;
  int maxTemp;
  int minTemp;
  int avgTemp;
  double totalprecip_mm;
  bool daily_will_it_rain;
  bool daily_chance_of_rain;
  String conditionText;
  String conditionIcon;
  int uv;
}
class Hourweather{
  String time;
  int temp;
  bool isDay;
  String conditionText;
  String conditionIcon;
  double wind_kph;
  bool will_it_rain;
  double chance_of_rain;
  int uv;
}
