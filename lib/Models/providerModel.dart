import 'package:flutter/material.dart';
import 'package:weather/Models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  Weather_Model? _weatherdata;
  String? cityName;
  set weatherdata(Weather_Model? weather) {
    _weatherdata = weather;
    notifyListeners();
  }

  Weather_Model? get weatherdata => _weatherdata;
}
