import 'package:weather_app/data/models/models.dart';

abstract class AppState {}

class InitialState extends AppState {}
class LoadingState extends AppState {}
class ErrorState extends AppState {
  String errorMessage;
  ErrorState(this.errorMessage);
}
class LoadedState extends AppState {
  Weather weatherData;
  LoadedState({required this.weatherData});
}



abstract class AppEvent {}

class AskForWeatherEvent extends AppEvent {}
class LoadingEvent extends AppEvent {}
class LoadedEvent extends AppEvent {}
class ErrorEvent extends AppEvent {}
