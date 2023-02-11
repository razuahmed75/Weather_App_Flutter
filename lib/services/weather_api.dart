import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/utils/app_consts.dart';

import '../models/weather_model.dart';

class WeatherApiClass {
  static Future<WeatherModel?> getWeather() async {
    var baseUrl = AppConstants.BASE_URL;
    var weatherApi = AppConstants.WEATHER_API;
    var apiKey = AppConstants.API_KEY;
    var location = "munshiganj";

    WeatherModel? result;
    final url = Uri.parse(
        baseUrl + weatherApi + "q=$location&appid=$apiKey&units=metric");
    var response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        result = WeatherModel.fromJson(data);
      }
    } catch (e) {
      throw Exception("Failed to load data");
    }
    return result;
  }
}
