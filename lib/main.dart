import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/Models/weather_model.dart';
import 'package:weather/screens/home_page.dart';
import 'package:weather/sercvise/services.dart';
import 'package:weather/weatherState/WeatherCubit.dart';

import 'Models/providerModel.dart';

void main() {
  runApp(Weather_App());
}

class Weather_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return WeatherCubit(
          Weather_services(),
        );
      },
      child: MaterialApp(
        title: 'Weather',
        home: Home_Page(),
        theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.greenAccent)),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
