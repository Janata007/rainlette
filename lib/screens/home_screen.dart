import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainlette/screens/widgets/buttons_widget.dart';

import '../constants.dart';
import '../utils/http_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.city});

  final String city;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String weatherData = "";
  String locationCountry = "";
  String locationCity = "";
  String localTime = "";
  String weather = "";
  String tempC = "";
  Map<String, dynamic> jsonData = {
    "location": 'info',
    "condition": 'condition info'
  };
  HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Welcome to Rainlette",
            style: TextStyle(color: lightBlue),
          ),
          backgroundColor: darkBlue,
        ),
        body: Scaffold(
          appBar: AppBar(
            title: Text(
              "",
              style: TextStyle(color: lightBlue),
            ),
            backgroundColor: darkBlue,
          ),
          body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("CITY: " + locationCity),
                SizedBox(
                  height: 20,
                ),
                Text("COUNTRY: " + locationCountry),
                SizedBox(
                  height: 20,
                ),
                Text("LOCAL DATE AND TIME: " + localTime),
                SizedBox(
                  height: 20,
                ),
                Text("CURRENT WEATHER: " + weather),
                SizedBox(
                  height: 20,
                ),
                Text("TEMPERATURE: " + tempC),
                TextButton(onPressed: getData, child: Text("get weather data")),
                SizedBox(
                  height: 20,
                ),
                myButtons(context),
              ],
            ),
          ),
        ));
  }

  Future<void> getData() async {
    weatherData = await httpService.getCurrentWeatherByCity(widget.city);
    resetState();
  }

  void resetState() {
    setState(() {
      jsonData = jsonDecode(weatherData);
      locationCity = jsonData['location']['name'];
      locationCountry = jsonData['location']['country'];
      localTime = jsonData['location']['localtime'];
      weather = jsonData['current']['condition']['text'];
      tempC = jsonData['current']['temp_c'].toString();
    });
  }
}
