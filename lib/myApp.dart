import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/routes/route_helper.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes(),
    );
  }
}
