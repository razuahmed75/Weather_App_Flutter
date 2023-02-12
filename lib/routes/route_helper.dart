import 'package:get/get.dart';
import 'package:weather_app/views/home/home.dart';

import 'routes_name.dart';

class RouteHelper {
  ///routes method
  static String getInitial() => RouteName.home;

  ///routes page list
  static List<GetPage> routes() => [
        GetPage(name: RouteName.home, page: () => HomeScreen()),
      ];
}
