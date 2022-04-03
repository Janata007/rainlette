import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rainlette/utils/location.dart';
import 'package:rainlette/utils/weather.dart';
import 'package:shared_preferences/shared_preferences.dart';

const semiBlue = Color.fromRGBO(143, 167, 196, 1);
const lightBlue = Color.fromRGBO(210, 236, 249, 1);
const lightGray = Color.fromRGBO(216, 220, 220, 1);
const darkBlue = Color.fromRGBO(36, 60, 108, 1);

WeatherData mainWeatherData = new WeatherData(locationData: LocationHelper());

final logo = Image.asset("assets/logo_nogb.png", width: 180, height: 180);
Image mainGif = Image.asset("assets/kiss.gif", height: 10, width: 10);
final storage = GetStorage();
final pref = getSharedPreferences();
String weatherData = "";
String locationCountry = "";
String locationCity = "";
String localTime = "";
String weather = "";
String tempC = "";
String selectedCity = "";
String forecastData = "";
String nextDay = "";
double day1Temp = 0;
double day2Temp = 0;
double day3Temp = 0;
List<String> daysTemp = [];
List<String> daysDates = [];
Map<String, dynamic> jsonData = {
  "location": 'info',
  "condition": 'condition info'
};
Map<String, dynamic> forecastJsonData = {
  "forecast": "",
};

getSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
}

List<String> citiesList = ["Skopje", "Budapest", "Ohrid"];

const kLinearGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [darkBlue, lightBlue],
);

Icon kCloudIcon = Icon(FontAwesomeIcons.cloud, size: 75.0, color: darkBlue);

Icon kSunIcon = Icon(
  // FontAwesomeIcons.sun,
  Icons.wb_sunny,
  size: 75.0,
  color: darkBlue,
);

Icon kMoonIcon = Icon(
  FontAwesomeIcons.moon,
  size: 75.0,
  color: darkBlue,
);
