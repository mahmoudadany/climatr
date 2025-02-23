import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_weather/core/utils/constane.dart';
import 'package:get_weather/core/utils/request_state.dart';
import 'package:get_weather/weather/presentation/controller/weather_cubit/weather_cubit.dart';
import 'package:get_weather/weather/presentation/controller/weather_cubit/weather_state.dart';

class HourlyForecastComponent extends StatelessWidget {
  const HourlyForecastComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      context.read<WeatherCubit>().hourlyForecastUpdateState();
      switch (state.hourlyForecastRequestState) {
        case RequestState.loading:
          return Center(child: CircularProgressIndicator());
        case RequestState.loaded:
          return Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10.0),
            child: Container(
              padding: EdgeInsetsDirectional.all(10.0),
              decoration: BoxDecoration(
                color: Color(0xffD0BCFF),
                borderRadius: BorderRadius.circular(15.0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.timelapse_rounded),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "Hourly Forecast",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 100.0,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.hourlyForecast!.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Text(
                            AppConstance.dateFormat(state.hourlyForecast![index].time),
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Icon(
                            AppConstance.weatherIcon(state.hourlyForecast![index].tempC.toInt()),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "${state.hourlyForecast![index].tempC.toInt()}°C",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        case RequestState.error:
          return Center(child: Text("error"));
      }
    });
  }
}
