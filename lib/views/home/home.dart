import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // Provider.of<WeatherController>(context, listen: false).getWeather();
    // WeatherApiClass.getWeather();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          final productModel =
              Provider.of<WeatherController>(context, listen: false)
                  .getWeather();
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<WeatherController>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Home Page"),
        centerTitle: true,
      ),
      body: Container(
        width: double.maxFinite,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 40),
            Container(
              height: 300,
              child: controller.isLoading
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SpinKitWave(
                            color: Colors.blueGrey.shade700,
                            size: 50.0,
                          ),
                          Text(
                            "Loading...",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.weatherData != null
                          ? controller.weatherData!.weather.length
                          : 0,
                      itemBuilder: (_, index) {
                        var datas = controller.weatherData!.weather[index];
                        controller.convertTimestamp(controller.weatherData!.dt);
                        return Card(
                          child: ListTile(
                            leading: Text(controller.formatedTime.toString()),
                            title: Text(datas.description.toString()),
                            // title: Text(datas.description.toString()),
                            subtitle: Text("Wind: " +
                                controller.weatherData!.wind.speed.toString() +
                                "km/h"),
                            trailing: Text("Temp: " +
                                controller.weatherData!.main.temp
                                    .floor()
                                    .toString() +
                                "°"),
                          ),
                        );
                      }),
            ),
            // Container(
            //   height: 400,
            //   child: FutureBuilder(
            //       future: data.getWeather(),
            //       builder: (_, AsyncSnapshot<WeatherModel?> snapshot) {
            //         if (!snapshot.hasData) {
            //           return Center(child: CircularProgressIndicator());
            //         }
            //         // if (snapshot.hasData && snapshot.data != null) {
            //         var data = snapshot.data!.weather;
            //         return ListView.builder(
            //             itemCount: data.length,
            //             itemBuilder: (_, index) {
            //               var datas = data[index];
            //               return ListTile(
            //                 title: Text(datas.description.toString()),
            //                 leading: Text(snapshot.data!.base),
            //               );
            //             });
            //         // }
            //         // return Center(child: Text("something went wrong"));
            //       }),
            // ),
          ],
        ),
      ),
    );
  }
}
