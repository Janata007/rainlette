import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Container(
        child: Column(
          children: [
            Text(weatherData),
            TextButton(onPressed: getData, child: Text("get weather data")),
          ],
        ),
      ),
    );
  }
  Future<void> getData() async {
    weatherData = await httpService.getCurrentWeatherByCity(widget.city);
    setState(() {});
  }
}