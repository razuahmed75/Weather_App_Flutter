import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controllers/weather_controller.dart';

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
    final productModel = Provider.of<WeatherController>(context, listen: true);

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
              child: productModel.isLoading && productModel.weatherData == null
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
                      itemCount: productModel.weatherData != null
                          ? productModel.weatherData!.weather.length
                          : 0,
                      itemBuilder: (_, index) {
                        var datas = productModel.weatherData!.weather[index];

                        return Card(
                          child: ListTile(
                            title: Text(datas.description.toString()),
                            subtitle: Text("Wind: " +
                                productModel.weatherData!.wind.speed
                                    .toString() +
                                "km/h"),
                            trailing: Text(datas.id.toString()),
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
