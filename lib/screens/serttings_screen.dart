import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainlette/constants.dart';
import 'package:rainlette/screens/password_change_screen.dart';
import 'package:rainlette/screens/username_change_screen.dart';
import 'package:rainlette/screens/widgets/buttons_widget.dart';
import 'package:rainlette/utils/weather.dart';

class MySettings extends StatefulWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  _MySettingsState createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  late Icon weatherDisplayIcon;

  @override
  void initState() {
    super.initState();
    WeatherDisplayData weatherDisplayData =
        mainWeatherData.getWeatherDisplayData();
    weatherDisplayIcon = weatherDisplayData.weatherIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Settings",
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
              scale: 7,
              //fit: BoxFit.contain,
            ),
          ),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.topLeft, height: 90, child: logo)
                  ]),
              const SizedBox(
                height: 55,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PasswordScreen()));
                  },
                  child: const Text(
                    "Change password",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: lightBlue),
                  )),
              SizedBox(height: 55.0),
              TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UsernameScreen()));
                  },
                  child: const Text("Change username",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: lightBlue))),
              const SizedBox(
                height: 55,
              ),
              myButtons(context),
            ],
          ),
        ));
  }
}
