import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

class AppConstance{
  static const String apiKey="80b0e02aacfb4ce0a61122857250202";
  static const String paseUrl="http://api.weatherapi.com/";
  static const String weatherBase="v1/current.json";
  static const String forecastBase="v1/forecast.json";
  static const String weatherCity="cairo";


  static IconData? weatherIcon(int temp_c){
    switch(temp_c){
      case <=5 :
        return WeatherIcons.snow;
      case >5 && <=15 :
        return Icons.ac_unit;
      case >15 && <=25 :
        return Icons.cloud;
      case >25 && <=30 :
        return WeatherIcons.day_sunny;
      case >30 && <=35 :
        return WeatherIcons.hot;
      case >35 :
        return Icons.wb_sunny;

    }
  }

  static String dateFormat(String date){
    DateTime dateTime=DateTime.parse(date);
    return DateFormat("HH:mm").format(dateTime);
  }

}