import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'myApp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherController()),
        // ChangeNotifierProvider(create: (_) => ProductData()),
      ],
      child: const MyApp(),
    ),
  );
}
