import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/data/network/get_search_data.dart';
import 'package:weather_app/ui/bloc/app_state.dart';
import 'package:weather_app/ui/bloc/search_cubit.dart';
import 'package:weather_app/ui/bloc/weater_bloc.dart';
import 'package:weather_app/ui/search_page.dart';
import 'package:weather_app/ui/widgets/mini_statu.dart';
import 'package:weather_app/ui/widgets/status_widget.dart';
import 'widgets/current_state_widget.dart';
import 'widgets/today_widget.dart';
import 'widgets/week_widget.dart';

class HomePage extends StatefulWidget {
  final String city;
  const HomePage({super.key, required this.city});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    context.read<WeaterBloc>().add(AskForWeatherEvent(widget.city));
    return BlocBuilder<WeaterBloc, AppState>(
      builder: (context, state) {
        if (state is LoadedState) {
          Weather weatherData = state.data;
          return Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: weatherData.current.isDay == 0
                    ? [
                        Color(0xFF08244F),
                        Color(0xFF134CBF),
                        Color(0xFF0842AB),
                      ]
                    : [
                        Color(0xFF29B2DD),
                        Color(0xFF33AADD),
                        Color(0xFF2DC8EA),
                      ],
                stops: [0.0, 0.47, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/location.svg"),
                        Expanded(child: SizedBox()),
                        Text(
                          weatherData.location.name,
                          style: TextStyle(
                            fontFamily: "SF Pro Display",
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                    create: (context) => SearchCubit(),
                                    child: SearchPage(
                                        colors: weatherData.current.isDay == 0
                                            ? [
                                                Color(0xFF08244F),
                                                Color(0xFF134CBF),
                                                Color(0xFF0842AB),
                                              ]
                                            : [
                                                Color(0xFF29B2DD),
                                                Color(0xFF33AADD),
                                                Color(0xFF2DC8EA),
                                              ]),
                                  ),
                                ),
                              );
                            },
                            child: SvgPicture.asset("assets/icons/search.svg")),
                      ],
                    ),
                    CurrentStateWidget(weatherData: weatherData),
                    SizedBox(
                      height: 20,
                    ),
                    TodayWidget(
                      todayData: weatherData.forecast.forecastday[0],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    WeekWidget(
                      forecast: weatherData.forecast,
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        MiniStatu(
                          iconPath: "assets/icons/sunrise.svg",
                          name: "Sunrise",
                          time:
                              weatherData.forecast.forecastday[0].astro.sunrise,
                        ),
                        SizedBox(
                          width: 28,
                        ),
                        MiniStatu(
                          iconPath: "assets/icons/sunset.svg",
                          name: "Sunset",
                          time:
                              weatherData.forecast.forecastday[0].astro.sunset,
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    StatusWidget(weatherData: weatherData),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          );
        }
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF29B2DD),
                Color(0xFF33AADD),
                Color(0xFF2DC8EA),
              ],
              // colors: weatherData.current.isDay == 0
              //     ? [
              //         Color(0xFF08244F),
              //         Color(0xFF134CBF),
              //         Color(0xFF0842AB),
              //       ]
              //     : [
              //         Color(0xFF29B2DD),
              //         Color(0xFF33AADD),
              //         Color(0xFF2DC8EA),
              //       ],
              stops: [0.0, 0.47, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        );
      },
    );
  }
}
