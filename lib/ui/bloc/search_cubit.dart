import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/city_model.dart';
import 'package:weather_app/data/network/get_search_data.dart';
import 'package:weather_app/ui/bloc/app_state.dart';

class SearchCubit extends Cubit<AppState> {
  SearchCubit() : super(InitialState());
  GetSearchData getSearchData = GetSearchData();
  getCities(String text) async {
    List<CityData> cities = [];
    cities =await getSearchData.getData(text);
    if (cities.isEmpty) {
      emit(EmptyState());
    } else {
      emit(LoadedState(data: cities));
    }
  }
}
