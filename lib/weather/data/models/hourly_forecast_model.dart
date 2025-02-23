import 'package:get_weather/weather/domain/entities/hourly_forecast.dart';

class HourlyForecastModel extends HourlyForecast{
  HourlyForecastModel(super.time, super.tempC);

 factory HourlyForecastModel.fromJson(Map<String,dynamic>json)=>
     HourlyForecastModel(
      json["time"],
      json["temp_c"]
    );


}