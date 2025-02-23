import 'package:get_weather/weather/domain/entities/hourly_forecast.dart';
import 'package:get_weather/weather/domain/repository/base_weather_repository.dart';

class ForeCastUseCase{
  final BaseWeatherRepository baseWeatherRepository;
  ForeCastUseCase(this.baseWeatherRepository);

  Future<List<HourlyForecast>> execute(String cityName)async{
    return await baseWeatherRepository.getHourlyForecast(cityName);
  }
}