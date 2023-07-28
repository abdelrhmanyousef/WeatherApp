import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/Models/weather_model.dart';
import 'package:weather/weatherState/WeatherCubit.dart';

import '../Models/providerModel.dart';
import '../sercvise/services.dart';

class Search_page extends StatelessWidget {
  Search_page({this.Updatui});
  VoidCallback? Updatui;
  @override
  Widget build(BuildContext context) {
    String? cityname;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search City",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onSubmitted: (data) async {
              cityname = data;
              BlocProvider.of<WeatherCubit>(context)
                  .getweather(cityname: cityname!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityname;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                hintText: "Enter City",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
                label: Text("Search"),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 25, horizontal: 20)),
          ),
        ),
      ),
    );
  }
}
