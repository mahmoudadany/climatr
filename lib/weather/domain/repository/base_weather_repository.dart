import 'package:get_weather/weather/domain/entities/hourly_forecast.dart';
import 'package:get_weather/weather/domain/entities/weathr.dart';

abstract class BaseWeatherRepository{

  Future<Weather> getWeatherByCityName(String cityName);
  Future<List<HourlyForecast>> getHourlyForecast(String cityName);
}