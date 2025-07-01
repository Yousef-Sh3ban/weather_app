import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/network/get_weather_data.dart';
import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/ui/bloc/app_state.dart';

class WeatherBloc extends Bloc<AppEvent, AppState> {
  WeatherBloc() : super(InitialState()) {
    on<AskForWeatherEvent>(sendWeatherData);
    on<RefreshWeatherEvent>(refreshWeatherData);
  }
  GetWeatherData getWeatherData = GetWeatherData();

  sendWeatherData(AskForWeatherEvent event, Emitter emit)async {
    emit(LoadingState());
    try {
      Weather data =await getWeatherData.getData(event.city);
      emit(LoadedState(data: data));
    } catch (e) {
      log(e.toString());
      emit(ErrorState(e.toString()));
    }
  }  refreshWeatherData(RefreshWeatherEvent event, Emitter emit)async {
    emit(LoadingState());
    try {
      Weather data =await getWeatherData.getData(event.city);
      emit(LoadedState(data: data));
    } catch (e) {
      log(e.toString());
      emit(ErrorState(e.toString()));
    }
  }
}
