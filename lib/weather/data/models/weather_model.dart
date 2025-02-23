import 'package:get_weather/weather/domain/entities/weathr.dart';

class WeatherModel extends Weather{
  WeatherModel(
    super.name,
    super.localtime,
    super.text,
    super.temp_c,
    super.temp_f,
    super.wind_kph,
    super.wind_degree,
    super.pressure_mb,
    super.uv
  );

  factory WeatherModel.fromJson(Map<String,dynamic>json)=>
      WeatherModel(
        json["location"]["name"],
        json["location"]["localtime"],
        json["current"]["condition"]["text"],
        json["current"]["temp_c"],
        json["current"]["temp_f"],
        json["current"]["wind_kph"],
        json["current"]["wind_degree"],
        json["current"]["pressure_mb"],
        json["current"]["uv"],
      );
}