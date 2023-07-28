import 'package:bloc/bloc.dart';
import 'package:weather/Models/weather_model.dart';
import 'package:weather/sercvise/services.dart';
import 'package:weather/weatherState/weatherstates.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherservice) : super(WeatherInistion());
  Weather_services weatherservice;
  Weather_Model? weathermodel;
  String? cityName;

  void getweather({required String cityname}) async {
    emit(WeatherLoading());

    try {
      weathermodel = await weatherservice.get_weather(cityname: cityname);
      emit(WeatherSuccess());
    } on Exception catch (e) {
      emit(WeatherFailuer());
    }
  }
}
