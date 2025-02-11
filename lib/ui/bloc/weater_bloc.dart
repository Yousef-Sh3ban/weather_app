import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/network/get_weathe_data.dart';
import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/ui/bloc/app_state.dart';

class WeaterBloc extends Bloc<AppEvent, AppState> {
  WeaterBloc() : super(InitialState()) {
    on<AskForWeatherEvent>(sendWeatherData);
  }
  GetWeatheData getWeatheData = GetWeatheData();

  sendWeatherData(AskForWeatherEvent event, Emitter emit)async {
    log("in the method");
    emit(LoadingState());
    try {
      Weather data =await getWeatheData.getData("Cairo");
      emit(LoadedState(weatherData: data));
    } catch (e) {
      log("error");
      log(e.toString());
      emit(ErrorState(e.toString()));
    }
  }
}
