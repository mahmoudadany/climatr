import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_weather/core/utils/constane.dart';
import 'package:get_weather/core/utils/request_state.dart';
import 'package:get_weather/weather/presentation/controller/weather_cubit/weather_cubit.dart';
import 'package:get_weather/weather/presentation/controller/weather_cubit/weather_state.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit,WeatherState>(
      builder: (context, state) {
        context.read<WeatherCubit>().weatherUpdateState();
        switch(state.weatherRequestState){

          case RequestState.loading:
            return Center(child: CircularProgressIndicator());
          case RequestState.loaded:
            return Column(
              children:
              [
                Container(
                  width: double.infinity,
                  height: 400.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    children: [
                       Image(
                        image: AssetImage("assets/images/weather_image.jpg"),
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding:const  EdgeInsetsDirectional.symmetric(
                          horizontal: 10.0,
                          vertical: 20.0,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      "Egypt,Cairo",
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Colors.white),
                                    ),
                                  ],
                                )),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${state.weatherModel!.temp_c}°",
                                          style: TextStyle(
                                            decoration: TextDecoration.none,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 35.0,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "C",
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          AppConstance.weatherIcon(state.weatherModel!.temp_c.toInt()),
                                          size: 60.0,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          state.weatherModel!.text,
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 25.0, color: Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  state.weatherModel!.localtime,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Color(0xffD0BCFF),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.wind_power_outlined),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Wind Speed",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    Text(
                                      "${state.weatherModel!.wind_kph} km/h",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15.0,),
                      Expanded(
                        child: Container(
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Color(0xffD0BCFF),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(WeatherIcons.strong_wind),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Wind Degree",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    Text(
                                      "${state.weatherModel!.wind_degree}",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Color(0xffD0BCFF),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.thermostat_outlined),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Pressure",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    Text(
                                      "${state.weatherModel!.pressure_mb.toInt()} hpa",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15.0,),
                      Expanded(
                        child: Container(
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Color(0xffD0BCFF),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.foggy),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "UV Index",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    Text(
                                      "${state.weatherModel!.uv}",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          case RequestState.error:
            return Center(child: Text("error"));
        }

      },
    );
  }
}
