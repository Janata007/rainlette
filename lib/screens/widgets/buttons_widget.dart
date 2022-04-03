import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainlette/screens/camera_screen.dart';
import 'package:rainlette/screens/login_screen.dart';
import 'package:rainlette/screens/main_screen.dart';
import 'package:rainlette/screens/my_places_screen.dart';
import 'package:rainlette/screens/profile_screen.dart';
import 'package:rainlette/screens/serttings_screen.dart';
import 'package:rainlette/utils/notification_api.dart';

import '../../constants.dart';

Widget myButtons(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MainScreen(weatherData: mainWeatherData)));
              },
              child: Container(
                  decoration: const BoxDecoration(
                      color: darkBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "Home",
                    style: TextStyle(color: lightBlue, fontSize: 15),
                  ))),
          // TextButton(
          //     onPressed: () {
          //       Navigator.of(context, rootNavigator: true).pop();
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => MyPlacesScreen()));
          //     },
          //     child: Container(
          //         decoration: const BoxDecoration(
          //             color: darkBlue,
          //             borderRadius: BorderRadius.all(Radius.circular(10.0))),
          //         padding: EdgeInsets.all(6),
          //         child: Text(
          //           "My places",
          //           style: const TextStyle(color: lightBlue, fontSize: 15),
          //         ))),
          TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MySettings()));
              },
              child: Container(
                  decoration: const BoxDecoration(
                      color: darkBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "Settings",
                    style: TextStyle(color: lightBlue, fontSize: 15),
                  ))),
          TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              child: Container(
                  decoration: const BoxDecoration(
                      color: darkBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "My Profile",
                    style: TextStyle(color: lightBlue, fontSize: 15),
                  ))),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CameraScreen()));
              },
              child: Container(
                  decoration: const BoxDecoration(
                      color: darkBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "Upload photo",
                    style: TextStyle(color: lightBlue, fontSize: 15),
                  ))),
          TextButton(
              onPressed: () async => {
                    NotificationApi.showNotification(
                        title: 'User',
                        body: 'Logging out',
                        payload: 'notification'),
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext ctx) => LoginScreen()))
                  },
              child: Container(
                  decoration: BoxDecoration(
                      color: darkBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "Log out",
                    style: TextStyle(color: lightBlue, fontSize: 15),
                  ))),
        ],
      )
    ],
  );
}
