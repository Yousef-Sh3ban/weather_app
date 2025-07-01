import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/functions/save_load_city.dart';
import 'package:weather_app/data/models/city_model.dart';
import 'package:weather_app/ui/bloc/weather_bloc.dart';
import 'package:weather_app/ui/home_page.dart';

class SearchReseltWidget extends StatelessWidget {
  final List<CityData> data;
  const SearchReseltWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, int index) {
          return InkWell(
            onTap: () {
              saveCity(data[index].name!);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => WeatherBloc(),
                    child: HomePage(
                      city: data[index].name!,
                    ),
                  ),
                ),
                (route) => false,
              );
            },
            child: Column(
              children: [
                Row(
                  spacing: 4,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 24,
                    ),
                    Expanded(
                      child: Text(
                        "${data[index].name}, ${data[index].country}",
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  width: double.infinity,
                  height: 6,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8)),
                ),
                SizedBox(
                  height: 22,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
