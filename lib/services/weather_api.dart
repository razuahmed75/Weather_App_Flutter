import 'dart:convert';
import 'dart:developer';

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
        result = weatherModelFromJson(response.body);
        print(data.toString());
        print("The printed value is: " + data["weather"][0]["main"].toString());
        return result;
      }
    } catch (e) {
      log("Failed to load weather data");
    }
    return result;
  }
}
