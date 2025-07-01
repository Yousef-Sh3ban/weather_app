abstract class AppState {}

class InitialState extends AppState {}

class LoadingState extends AppState {}

class EmptyState extends AppState {}

class ErrorState extends AppState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class LoadedState extends AppState {
  dynamic data;
  LoadedState({required this.data});
}

abstract class AppEvent {}

class AskForWeatherEvent extends AppEvent {
  String city;
  AskForWeatherEvent(this.city);
}
class RefreshWeatherEvent extends AppEvent {
  String city;
  RefreshWeatherEvent(this.city);
}

class LoadingEvent extends AppEvent {}

class LoadedEvent extends AppEvent {}

class ErrorEvent extends AppEvent {}
