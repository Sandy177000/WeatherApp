import 'package:flutter/material.dart';
import 'package:weatherapp/data_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String name = "";
  double temp = 0;
  String weather = "";
  String icon = "";

  TextEditingController textEditingController = TextEditingController();
  DataService dataService = DataService();

  void getData(String x) async {
    final response = await dataService.getWeather(x);

    if (response.cityName.length > 0) {
      setState(() {
        name = response.cityName;
        temp = response.temp.temp;
        weather = response.weatherDetails.weather;
        icon = response.weatherDetails.icon;
      });
    }
  }

  Widget text(String x) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        x,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget buildWeatherInfo() {
    if (name.length > 0) {
      return Container(
          width: 200,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0), // Set the background color
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 0, 255, 208), // Set the shadow color
                offset: Offset(0, 2), // Set the shadow offset
                blurRadius: 15.0, // Set the blur radius
                spreadRadius: 1.0, // Set the spread radius
              ),
            ],
            border: Border.all(color: Colors.white, width: 1),
            borderRadius:
                BorderRadius.circular(12.0), // Optional: Add border radius
          ),
          child: Center(
              child: Column(
            children: [
              text(name),
              text('$temp C'),
              Image.network(icon),
              text(weather),
            ],
          )));
    } else {
      return Container(); // Return an empty container if no weather data is available
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: 500,
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildWeatherInfo(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: SizedBox(
                width: 300,
                height: 80,
                child: TextField(
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  controller: textEditingController,
                  decoration: const InputDecoration(
                      labelText: 'Enter Location',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(165, 251, 251, 251))),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String x = textEditingController.text;
                getData(x);
              },
              
              style: ButtonStyle(
                
              backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0), // Set the button border radius
                  side: BorderSide(color: Color.fromARGB(255, 0, 255, 225)), // Set the button border color
                ),
              ),
            ),

              child: const Text(
                "Get Weather",
                style: TextStyle(color: Color.fromARGB(255, 234, 234, 234)),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
