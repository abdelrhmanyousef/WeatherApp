import 'package:flutter/material.dart';

class Weather_Model {
  String date;
  double Temp;
  double minTemp;
  double maxTemp;
  String condition;

  Weather_Model(
      {required this.date,
      required this.Temp,
      required this.minTemp,
      required this.maxTemp,
      required this.condition});
  factory Weather_Model.fromjson(dynamic data) {
    var jsondata = data["forecast"]['forecastday'][0]['day'];

    return Weather_Model(
        date: data["location"]["localtime"],
        Temp: jsondata['avgtemp_c'],
        minTemp: jsondata['mintemp_c'],
        maxTemp: jsondata['maxtemp_c'],
        condition: jsondata['condition']["text"]);
  }
  @override
  String toString() {
    return 'tem=$Temp minTemp =$minTemp maxTemp=$maxTemp  date = $date condition=$condition ';
  }

  String getImage() {
    if (condition == 'Sunny' ||
        condition == 'Clear' ||
        condition == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (condition == 'Blizzard' ||
        condition == 'Patchy snow possible' ||
        condition == 'Patchy sleet possible' ||
        condition == 'Patchy freezing drizzle possible' ||
        condition == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (condition == 'Freezing fog' ||
        condition == 'Fog' ||
        condition == 'Heavy Cloud' ||
        condition == 'Mist' ||
        condition == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (condition == 'Patchy rain possible' ||
        condition == 'Heavy Rain' ||
        condition == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (condition == 'Thundery outbreaks possible' ||
        condition == 'Moderate or heavy snow with thunder' ||
        condition == 'Patchy light snow with thunder' ||
        condition == 'Moderate or heavy rain with thunder' ||
        condition == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (condition == 'Sunny' ||
        condition == 'Clear' ||
        condition == 'partly cloudy') {
      return Colors.orange;
    } else if (condition == 'Blizzard' ||
        condition == 'Patchy snow possible' ||
        condition == 'Patchy sleet possible' ||
        condition == 'Patchy freezing drizzle possible' ||
        condition == 'Blowing snow') {
      return Colors.blue;
    } else if (condition == 'Freezing fog' ||
        condition == 'Fog' ||
        condition == 'Heavy Cloud' ||
        condition == 'Mist' ||
        condition == 'Fog') {
      return Colors.blueGrey;
    } else if (condition == 'Patchy rain possible' ||
        condition == 'Heavy Rain' ||
        condition == 'Showers	') {
      return Colors.blue;
    } else if (condition == 'Thundery outbreaks possible' ||
        condition == 'Moderate or heavy snow with thunder' ||
        condition == 'Patchy light snow with thunder' ||
        condition == 'Moderate or heavy rain with thunder' ||
        condition == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
