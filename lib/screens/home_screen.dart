import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainlette/screens/widgets/buttons_widget.dart';
import 'package:rainlette/screens/widgets/my_button.dart';

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
  String _newCity = "";
  Map<String, dynamic> jsonData = {
    "location": 'info',
    "condition": 'condition info'
  };
  final TextEditingController _cityTextController = TextEditingController();
  HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    final newCity = TextFormField(
      decoration: const InputDecoration(hintText: "Add City"),
      controller: _cityTextController,
      validator: (val) => val!.isEmpty ? 'enter city' : null,
      onSaved: (val) => _newCity = val!,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "City info",
          style: TextStyle(color: lightBlue),
        ),
        backgroundColor: darkBlue,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [semiBlue, darkBlue],
              begin: Alignment(-1, -0.5),
              end: Alignment(2, 2)),
          color: semiBlue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            newCity,
            SizedBox(
              height: 20,
            ),
            MyButton(label: "Add city", onPressed: addCity),
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    color: darkBlue, border: Border.all(color: lightBlue)),
                padding: EdgeInsets.all(20),
                child: Text("CITY: " + locationCity,
                    style: TextStyle(fontSize: 20))),
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    color: darkBlue, border: Border.all(color: lightBlue)),
                padding: EdgeInsets.all(20),
                child: Text("COUNTRY: " + locationCountry,
                    style: TextStyle(fontSize: 20))),
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    color: darkBlue, border: Border.all(color: lightBlue)),
                padding: EdgeInsets.all(20),
                child: Text("LOCAL DATE AND TIME: " + localTime,
                    style: TextStyle(fontSize: 20))),
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    color: darkBlue, border: Border.all(color: lightBlue)),
                padding: EdgeInsets.all(20),
                child: Text("CURRENT WEATHER: " + weather,
                    style: TextStyle(fontSize: 20))),
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    color: darkBlue, border: Border.all(color: lightBlue)),
                padding: EdgeInsets.all(20),
                child: Text("TEMPERATURE: " + tempC,
                    style: TextStyle(fontSize: 20))),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: getData,
                child: Text(
                  "get weather data",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
            SizedBox(
              height: 20,
            ),
            myButtons(context),
          ],
        ),
      ),
    );
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

  void addCity() {
    _newCity = _cityTextController.text;
    if (_newCity == "") {
    } else {
      citiesList.add(_newCity);
      //redirectToHome();
    }
  }
}
