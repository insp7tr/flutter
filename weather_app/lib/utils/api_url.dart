import 'package:weather_app/api/api_key.dart';

String apiURL(var lat, var lng) {
  return "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lng&appid=$apiKey&units=metric&exclude=minutely";
}
