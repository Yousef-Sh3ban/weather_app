import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/city_model.dart';
import 'package:weather_app/ui/bloc/app_state.dart';
import 'package:weather_app/ui/bloc/search_cubit.dart';
import 'package:weather_app/ui/widgets/search_reselt_widget.dart';

class SearchPage extends StatelessWidget {
  final List<Color> colors;
  final int resultsCount = 3;
  const SearchPage({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    TextEditingController cityTextEditingController = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              stops: [0.0, 0.47, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: BlocBuilder<SearchCubit, AppState>(
            builder: (context, state) {
              SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
              return Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        searchCubit.getCities(value);
                      }
                    },
                    controller: cityTextEditingController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.2),
                      hintText: "Search for your city",
                      hintStyle: TextStyle(color: Color(0xFFE2CFE5)),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      prefixIcon: Icon(Icons.menu, color: Color(0xFF49454f)),
                      suffixIcon: Icon(Icons.search, color: Color(0xFF49454f)),
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    style: TextStyle(color: Color(0xFFE2CFE5)),
                  ),
                  if (state is LoadedState)
                    SearchReseltWidget(
                      data: state.data,
                    )
                  else
                    SizedBox()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
