class Weather {
    Weather({
        required this.location,
        required this.current,
        required this.forecast,
    });

    final Location location;
    final Current current;
    final Forecast forecast;

    factory Weather.fromJson(Map<String, dynamic> json){ 
        return Weather(
            location:  Location.fromJson(json["location"]),
            current: Current.fromJson(json["current"]),
            forecast:  Forecast.fromJson(json["forecast"]),
        );
    }

}

class Current {
    Current({
        required this.lastUpdated,
        required this.tempC,
        required this.isDay,
        required this.condition,
        required this.windKph,
        required this.humidity,
        required this.cloud,
        required this.feelslikeC,
        required this.visKm,
        required this.uv,
    });

    final String lastUpdated;
    final double tempC;
    final int isDay;
    final CurrentCondition condition;
    final double windKph;
    final int humidity;
    final int cloud;
    final double feelslikeC;
    final double visKm;
    final double uv;

    factory Current.fromJson(Map<String, dynamic> json){ 
        return Current(
            lastUpdated: json["last_updated"],
            tempC: json["temp_c"],
            isDay: json["is_day"],
            condition: CurrentCondition.fromJson(json["condition"]),
            windKph: json["wind_kph"],
            humidity: json["humidity"],
            cloud: json["cloud"],
            feelslikeC: json["feelslike_c"],
            visKm: json["vis_km"],
            uv: (json["uv"] as num).toDouble(),
        );
    }

}

class CurrentCondition {
    CurrentCondition({
        required this.text,
        required this.icon,
        required this.code,
    });

    final String text;
    final String icon;
    final int code;

    factory CurrentCondition.fromJson(Map<String, dynamic> json){ 
        return CurrentCondition(
            text: json["text"],
            icon: json["icon"],
            code: json["code"],
        );
    }

}

class Forecast {
    Forecast({
        required this.forecastday,
    });

    final List<Forecastday> forecastday;

    factory Forecast.fromJson(Map<String, dynamic> json){ 
        return Forecast(
            forecastday: json["forecastday"] == null ? [] : List<Forecastday>.from(json["forecastday"]!.map((x) => Forecastday.fromJson(x))),
        );
    }

}

class Forecastday {
    Forecastday({
        required this.date,
        required this.day,
        required this.astro,
        required this.hour,
    });

    final DateTime? date;
    final Day day;
    final Astro astro;
    final List<Hour> hour;

    factory Forecastday.fromJson(Map<String, dynamic> json){ 
        return Forecastday(
            date: DateTime.tryParse(json["date"] ?? ""),
            day:  Day.fromJson(json["day"]),
            astro:  Astro.fromJson(json["astro"]),
            hour: json["hour"] == null ? [] : List<Hour>.from(json["hour"]!.map((x) => Hour.fromJson(x))),
        );
    }

}

class Astro {
    Astro({
        required this.sunrise,
        required this.sunset,
    });

    final String sunrise;
    final String sunset;

    factory Astro.fromJson(Map<String, dynamic> json){ 
        return Astro(
            sunrise: json["sunrise"],
            sunset: json["sunset"],
        );
    }

}

class Day {
    Day({
        required this.maxtempC,
        required this.mintempC,
        required this.avgtempC,
        required this.totalprecipMm,
        required this.dailyWillItRain,
        required this.dailyChanceOfRain,
        required this.dailyWillItSnow,
        required this.dailyChanceOfSnow,
        required this.condition,
        required this.uv,
    });

    final double maxtempC;
    final double mintempC;
    final double avgtempC;
    final double totalprecipMm;
    final int dailyWillItRain;
    final int dailyChanceOfRain;
    final int dailyWillItSnow;
    final int dailyChanceOfSnow;
    final DayCondition condition;
    final double uv;

    factory Day.fromJson(Map<String, dynamic> json){ 
        return Day(
            maxtempC: json["maxtemp_c"],
            mintempC: json["mintemp_c"],
            avgtempC: json["avgtemp_c"],
            totalprecipMm: json["totalprecip_mm"],
            dailyWillItRain: json["daily_will_it_rain"],
            dailyChanceOfRain: json["daily_chance_of_rain"],
            dailyWillItSnow: json["daily_will_it_snow"],
            dailyChanceOfSnow: json["daily_chance_of_snow"],
            condition: DayCondition.fromJson(json["condition"]),
            uv: (json["uv"] as num).toDouble(),
        );
    }

}

class DayCondition {
    DayCondition({
        required this.text,
        required this.icon,
    });

    final String text;
    final String icon;

    factory DayCondition.fromJson(Map<String, dynamic> json){ 
        return DayCondition(
            text: json["text"],
            icon: json["icon"],
        );
    }

}

class Hour {
    Hour({
        required this.time,
        required this.tempC,
        required this.isDay,
        required this.condition,
        required this.windKph,
        required this.cloud,
        required this.feelslikeC,
        required this.willItRain,
        required this.chanceOfRain,
        required this.willItSnow,
        required this.chanceOfSnow,
        required this.gustKph,
        required this.uv,
    });

    final String time;
    final double tempC;
    final int isDay;
    final DayCondition condition;
    final double windKph;
    final int cloud;
    final double feelslikeC;
    final int willItRain;
    final int chanceOfRain;
    final int willItSnow;
    final int chanceOfSnow;
    final double gustKph;
    final double uv;

    factory Hour.fromJson(Map<String, dynamic> json){ 
        return Hour(
            time: json["time"],
            tempC: json["temp_c"],
            isDay: json["is_day"],
            condition: DayCondition.fromJson(json["condition"]),
            windKph: json["wind_kph"],
            cloud: json["cloud"],
            feelslikeC: json["feelslike_c"],
            willItRain: json["will_it_rain"],
            chanceOfRain: json["chance_of_rain"],
            willItSnow: json["will_it_snow"],
            chanceOfSnow: json["chance_of_snow"],
            gustKph: json["gust_kph"],
            uv: (json["uv"] as num).toDouble(),
        );
    }

}

class Location {
    Location({
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.tzId,
        required this.localtimeEpoch,
        required this.localtime,
    });

    final String name;
    final String region;
    final String country;
    final double lat;
    final double lon;
    final String tzId;
    final int localtimeEpoch;
    final String localtime;

    factory Location.fromJson(Map<String, dynamic> json){ 
        return Location(
            name: json["name"],
            region: json["region"],
            country: json["country"],
            lat: json["lat"],
            lon: json["lon"],
            tzId: json["tz_id"],
            localtimeEpoch: json["localtime_epoch"],
            localtime: json["localtime"],
        );
    }

}
