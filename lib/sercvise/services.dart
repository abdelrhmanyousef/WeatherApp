import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/Models/weather_model.dart';

class Weather_services {
  Future<Weather_Model> get_weather({required String cityname}) async {
    String apk = "25edae9e11bc4270a7405554231307";
    String baseUrl = "http://api.weatherapi.com/v1";
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$apk&q=$cityname&days=1');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    print(data);
    Weather_Model weather = Weather_Model.fromjson(data);
    return weather;
  }
}
