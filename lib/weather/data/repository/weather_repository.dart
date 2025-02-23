import 'package:get_weather/weather/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:get_weather/weather/domain/entities/hourly_forecast.dart';
import 'package:get_weather/weather/domain/entities/weathr.dart';
import 'package:get_weather/weather/domain/repository/base_weather_repository.dart';

class WeatherRepository extends BaseWeatherRepository{
  final BaseRemoteDataSource baseRemoteDataSource;

  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<Weather> getWeatherByCityName(String cityName) async{
   return await baseRemoteDataSource.getWeatherByCityName(cityName);
  }

  @override
  Future<List<HourlyForecast>> getHourlyForecast(String cityName) async {
    return await baseRemoteDataSource.getHourlyForecast(cityName);
  }

}