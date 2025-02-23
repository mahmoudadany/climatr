class Weather{
  final String name;
  final String localtime;
  final String text;
  final double temp_c;
  final double temp_f;
  final double wind_kph;
  final int wind_degree;
  final double pressure_mb;
  final double uv;

  Weather(this.name, this.localtime, this.text, this.temp_c, this.temp_f,this.wind_kph,this.wind_degree,this.pressure_mb,this.uv);
}