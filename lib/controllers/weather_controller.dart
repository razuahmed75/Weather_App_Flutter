import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_api.dart';

class WeatherController extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// weather controller
  WeatherModel? weatherData;
  Future<void> getWeather() async {
    _isLoading = true;
    notifyListeners();

    weatherData = await WeatherApiClass.getWeather();
    _isLoading = false;

    notifyListeners();
  }

  /// formatted date-time
  String formatedTime = "";

  /// convert into date-time
  String convertTimestamp(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formatter = DateFormat('EEEE, MMMM d, yyyy h:mm a');
    formatedTime = formatter.format(date);
    return formatedTime;
  }

  /// convert into current time
  // String formatWeatherTime(int timeInSeconds) {
  //   var date = DateTime.fromMillisecondsSinceEpoch(timeInSeconds * 1000);
  //   var formatter = DateFormat.jm();
  //   formatedTime = formatter.format(date);
  //   return formatedTime;
  // }

}
