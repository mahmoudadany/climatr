import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_weather/core/utils/request_state.dart';
import 'package:get_weather/weather/presentation/components/hourly_forecast_component.dart';
import 'package:get_weather/weather/presentation/components/weather_data.dart';
import 'package:get_weather/weather/presentation/controller/weather_cubit/weather_cubit.dart';
import 'package:get_weather/weather/presentation/controller/weather_cubit/weather_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children:
              [
                WeatherData(),
                const SizedBox(height: 10.0,),
                HourlyForecastComponent(),
              ],
            ),
            // const SizedBox(height: 10.0,),
            // HourlyForecastComponent(),
          ],
        ),
      ),
    );
  }
}
