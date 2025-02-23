import 'package:bloc/bloc.dart';
import 'package:get_weather/core/utils/request_state.dart';
import 'package:get_weather/weather/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:get_weather/weather/data/models/hourly_forecast_model.dart';
import 'package:get_weather/weather/data/models/weather_model.dart';
import 'package:get_weather/weather/data/repository/weather_repository.dart';
import 'package:get_weather/weather/domain/repository/base_weather_repository.dart';
import 'package:get_weather/weather/domain/usecase/get_forecast_usecase.dart';
import 'package:get_weather/weather/domain/usecase/get_weather_usecase.dart';
import 'package:get_weather/weather/presentation/controller/weather_cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitState());
  WeatherState weatherUpdate = WeatherUpdate.getInstance();

  void weatherUpdateState() async {
    BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
    BaseWeatherRepository baseWeatherRepository =
        WeatherRepository(baseRemoteDataSource);
     var result= await WeatherUseCase(baseWeatherRepository).execute("cairo");
    weatherUpdate.weatherModel = result as WeatherModel;
    weatherUpdate.weatherRequestState = RequestState.loaded;
    emit(weatherUpdate);

  }

  void hourlyForecastUpdateState() async {
    BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
    BaseWeatherRepository baseWeatherRepository =
        WeatherRepository(baseRemoteDataSource);
   var result= await ForeCastUseCase(baseWeatherRepository).execute("cairo");
    weatherUpdate.hourlyForecast = result.cast<HourlyForecastModel>();
    weatherUpdate.hourlyForecastRequestState = RequestState.loaded;
    emit(weatherUpdate);

  }
}
