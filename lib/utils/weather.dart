import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:rainlette/constants.dart';

import 'location.dart';

const apiKey = '74c833a7b216b39fcd82ea6f6ae22a27';

class WeatherDisplayData {
  Icon weatherIcon;
  AssetImage weatherImage;

  WeatherDisplayData({required this.weatherIcon, required this.weatherImage});
}

class WeatherData {
  WeatherData({required this.locationData});

  late LocationHelper locationData;
  late double currentTemperature;
  late int currentCondition;
  late String currentCity;

  Future<void> getCurrentTemperature() async {
        Response response = await get(
    Uri.parse('http://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}&units=metric'));
    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = jsonDecode(data);

      try {
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['id'];
      } catch (e) {
        print(e);
      }
    } else {
      print('Could not fetch temperature!');
    }
  }

  WeatherDisplayData getWeatherDisplayData() {
    if (currentCondition < 600) {
      return WeatherDisplayData(
        weatherIcon: Icon(
          Icons.wb_cloudy_outlined,
          size: 75.0,
        ),
        weatherImage: AssetImage('assets/cloudy.png'),
      );
    } else {
      var now = new DateTime.now();

      if (now.hour >= 15) {
        return WeatherDisplayData(
          weatherImage: AssetImage('assets/night.png'),
          weatherIcon: Icon(
            Icons.nights_stay,
            size: 75.0,
            color: Colors.white,
          ),
        );
      } else {
        return WeatherDisplayData(
          weatherIcon: Icon(
            Icons.wb_sunny,
            size: 75.0,
            color: Colors.white,
          ),
          weatherImage: AssetImage('assets/sunny.png'),
        );
      }
    }
  }
}