import 'package:get_weather/weather/domain/entities/weathr.dart';
import 'package:get_weather/weather/domain/repository/base_weather_repository.dart';


class WeatherUseCase{
  final BaseWeatherRepository baseWeatherRepository;

  WeatherUseCase(this.baseWeatherRepository);

  Future<Weather> execute(String cityName)async{
    return await baseWeatherRepository.getWeatherByCityName(cityName);
  }
}