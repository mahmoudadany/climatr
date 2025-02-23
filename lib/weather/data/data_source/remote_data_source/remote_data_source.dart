import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_weather/core/utils/constane.dart';
import 'package:get_weather/weather/data/models/hourly_forecast_model.dart';
import 'package:get_weather/weather/data/models/weather_model.dart';

abstract class BaseRemoteDataSource{
  Future<WeatherModel> getWeatherByCityName(String cityName);
  Future<List<HourlyForecastModel>> getHourlyForecast(String cityName);
}


class RemoteDataSource extends BaseRemoteDataSource{
  @override
  Future<WeatherModel> getWeatherByCityName(String cityName) async{
    var response = await Dio()
        .get("${AppConstance.paseUrl}${AppConstance.weatherBase}?key=${AppConstance.apiKey}&q=$cityName");
    return WeatherModel.fromJson(response.data);
  }

  @override
  Future<List<HourlyForecastModel>> getHourlyForecast(String cityName) async {
    var result=await Dio().get("${AppConstance.paseUrl}${AppConstance.forecastBase}?key=${AppConstance.apiKey}&q=$cityName");
    return List<HourlyForecastModel>.from((result.data["forecast"]["forecastday"][0]["hour"] as List).map((e) => HourlyForecastModel.fromJson(e),));
  }

}

