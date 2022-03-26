import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:rainlette/constants.dart';
import 'package:rainlette/screens/widgets/buttons_widget.dart';
import 'package:rainlette/screens/widgets/cities_view.dart';
import 'package:rainlette/utils/getlocation.dart';
import 'package:rainlette/utils/weather.dart';

class MainScreen extends StatefulWidget {
  MainScreen({required this.weatherData});

  late final WeatherData weatherData;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int temperature;
  late Icon weatherDisplayIcon;
  getLocation location = getLocation();

  void updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      temperature = weatherData.currentTemperature.round();
      WeatherDisplayData weatherDisplayData =
          weatherData.getWeatherDisplayData();
      weatherDisplayIcon = weatherDisplayData.weatherIcon;
    });
  }

  @override
  void initState() {
    super.initState();

    updateDisplayInfo(widget.weatherData);
    location.getCityF(widget.weatherData.locationData.longitude,
        widget.weatherData.locationData.latitude);
  }

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
        width: 50,
        height: 20,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [semiBlue, darkBlue],
              begin: Alignment(-1, -0.5),
              end: Alignment(2, 2)),
          color: semiBlue,
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            image: mainGif.image,
            scale: 6,
            //fit: BoxFit.contain,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 55,
            ),
            Container(
              child: weatherDisplayIcon,
            ),
            SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                ' $temperature°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60.0,
                  letterSpacing: -5,
                ),
              ),
            ),
            Center(child: Text(location.cityName) //insert current location
                ),
            SizedBox(
              height: 15.0,
            ),
            myCities(context),
            SizedBox(
              height: 20.0,
            ),
            myButtons(context)
          ],
        ),
      ),
    );
  }

  Future<List<Placemark>> placemarks() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        widget.weatherData.locationData.latitude,
        widget.weatherData.locationData.longitude);
    return placemarks;
  }
}
