import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/app/functions/save_load_city.dart';
import 'package:weather_app/app/location_handler.dart';
import 'package:weather_app/data/network/get_search_data.dart';
import 'package:weather_app/ui/bloc/weather_bloc.dart';
import 'package:weather_app/ui/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Position position = await LocationHandler.getCurrentLocation();

  runApp(MyApp(position: position));
}

class MyApp extends StatelessWidget {
  final Position position;

  const MyApp({super.key, required this.position});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<String?>(
        future: loadCity(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF29B2DD),
                              Color(0xFF33AADD),
                              Color(0xFF2DC8EA),
                            ],
                            stops: [0.0, 0.47, 1.0],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Center(child: CircularProgressIndicator())),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            return BlocProvider(
              create: (context) => WeatherBloc(),
              child: HomePage(city: snapshot.data!),
            );
          } else {
            return FutureBuilder<String>(
              future: GetSearchData.getCityWithLocation(
                position.latitude,
                position.longitude,
              ),
              builder: (context, citySnapshot) {
                if (citySnapshot.connectionState == ConnectionState.waiting) {
                  return Scaffold(
                    body: Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF29B2DD),
                                Color(0xFF33AADD),
                                Color(0xFF2DC8EA),
                              ],
                              stops: [0.0, 0.47, 1.0],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Center(child: CircularProgressIndicator())),
                    ),
                  );
                } else if (citySnapshot.hasData) {
                  return BlocProvider(
                    create: (context) => WeatherBloc(),
                    child: HomePage(city: citySnapshot.data!),
                  );
                } else {
                  return Scaffold(
                    body: Center(child: Text("Failed to get city")),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
