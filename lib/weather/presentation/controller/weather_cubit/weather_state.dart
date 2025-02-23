import 'package:get_weather/core/utils/request_state.dart';
import 'package:get_weather/weather/data/models/hourly_forecast_model.dart';
import 'package:get_weather/weather/data/models/weather_model.dart';

abstract class WeatherState{
   WeatherModel? weatherModel;
   RequestState weatherRequestState;
   List<HourlyForecastModel>? hourlyForecast;
   RequestState hourlyForecastRequestState;

  WeatherState({
    this.weatherModel,
    this.weatherRequestState=RequestState.loading,
    this.hourlyForecast,
    this.hourlyForecastRequestState=RequestState.loading,
  });

}

class WeatherInitState extends WeatherState{
}

class WeatherUpdate extends WeatherState{
  WeatherUpdate._(): super();
  factory WeatherUpdate.getInstance() {
    return WeatherUpdate._();
  }
}

class HourlyForecastUpdate extends WeatherState{
  HourlyForecastUpdate._(): super();
  factory HourlyForecastUpdate.getInstance()=>
      HourlyForecastUpdate._();
}