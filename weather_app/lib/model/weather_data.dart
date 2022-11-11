import 'package:weather_app/model/weather_data_current.dart';
import 'package:weather_app/model/weather_data_daily.dart';
import 'package:weather_app/model/weather_data_hourly.dart';

class WeatherData {
  final WeatherDataCurrent? weatherDataCurrent;
  final WeatherDataHourly? weatherDataHourly;
  final WeatherDataDaily? weatherDataDaily;

  WeatherData(
      [this.weatherDataCurrent, this.weatherDataHourly, this.weatherDataDaily]);

  WeatherDataCurrent getCurrentWeather() => weatherDataCurrent!;
  WeatherDataHourly getHourlyWeather() => weatherDataHourly!;
  WeatherDataDaily getDailyWeather() => weatherDataDaily!;
}
