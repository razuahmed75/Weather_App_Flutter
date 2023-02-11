import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_api.dart';

class WeatherController extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  WeatherModel? weatherData;
  Future<void> getWeather() async {
    _isLoading = true;
    notifyListeners(); // when i call controller method in futurebuildr then it should be commented and controller method should not be <void> type.

    weatherData = await WeatherApiClass.getWeather();
    _isLoading = false;

    notifyListeners();
  }
}
