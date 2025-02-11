import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/data/network/get_weathe_data.dart';
import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/ui/bloc/app_state.dart';
import 'package:weather_app/ui/bloc/weater_bloc.dart';
import 'widgets/current_state_widget.dart';
import 'widgets/today_widget.dart';
import 'widgets/week_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    context.read<WeaterBloc>().add(AskForWeatherEvent());
    return BlocBuilder<WeaterBloc, AppState>(
      builder: (context, state) {
        if (state is LoadedState) {
          Weather weatherData = state.weatherData;
          return Container(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
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
                        SvgPicture.asset("assets/icons/search.svg"),
                      ],
                    ),
                    CurrentStateWidget(weatherData: weatherData),
                    SizedBox(
                      height: 20,
                    ),
                    TodayWidget(weatherData: weatherData,),
                    SizedBox(
                      height: 20,
                    ),
                    WeekWidget(),
                  ],
                ),
              ),
            ),
          );
        }
        return Center(
          child: Text("NOt loaded"),
        );
      },
    );
  }
}
