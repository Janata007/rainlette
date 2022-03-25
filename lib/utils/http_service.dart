import 'dart:convert';

import 'package:http/http.dart' as http;

 class HttpService {
  final String baseURL = "http://api.weatherapi.com/v1";
  String key = "66af195f120e4395926133127222403";

//parameters required: API key, coordinates
  Future<void> getCurrentWeatherByLatLong(int latitude, int longitude) async {
    String url = baseURL + "/current.json?" + "key=" + key + "&q=" + latitude.toString() + "," + longitude.toString();
    var mainUrl = Uri.parse(url);
    var response = await http.post(mainUrl);
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    print('Response body: ${response.body}');
  }

  //parameters required: API key, city
  Future<String> getCurrentWeatherByCity(String city) async {
    String url = baseURL + "/current.json?" + "key=" + key + "&q=" + city;
    var mainUrl = Uri.parse(url);
    var response = await http.post(mainUrl);
    print('Response body: ${response.body}');
    return response.body;
  }

//parameters required: API key, coordinates, days
  Future<void> getForecastWeatherByLatLong(int latitude, int longitude, int days) async {
    String url = baseURL + "/forecast.json";
    var mainUrl = Uri.parse(url);
    var response = await http.post(mainUrl);
  }

  //parameters required: API key, city name, days
  Future<void> getForecastWeatherByCity(String city, int days) async {
    String url = baseURL + "/forecast.json";
    var mainUrl = Uri.parse(url);
    var response = await http.post(mainUrl);
  }
}
