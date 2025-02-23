import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_weather/weather/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:get_weather/weather/data/repository/weather_repository.dart';
import 'package:get_weather/weather/domain/repository/base_weather_repository.dart';
import 'package:get_weather/weather/domain/usecase/get_forecast_usecase.dart';
import 'package:get_weather/weather/domain/usecase/get_weather_usecase.dart';
import 'package:get_weather/weather/presentation/controller/weather_cubit/weather_cubit.dart';
import 'package:get_weather/weather/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()
        ..weatherUpdateState()
        ..hourlyForecastUpdateState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

