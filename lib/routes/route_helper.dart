import 'package:get/get.dart';
import 'package:weather_app/views/home/home.dart';

class RouteHelper {
  /// routes String
  static String home = "/";
  // static String sub = "/sub";

  /// routes method
  static String getInitial() => home;
  // static String getSubScreenRoute() => sub;

  /// routes page list
  static List<GetPage> routes() => [
        GetPage(name: home, page: () => HomeScreen()),
      ];
}
