
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainlette/screens/home_screen.dart';

import '../constants.dart';

Widget cities(BuildContext context) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7.0)),
        color: darkBlue,
        border: Border.all(color: Colors.white, width: 5),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                city: 'Skopje',
                              )));
                },
                child: tileContainer("Skopje")),
            TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                city: 'Budapest',
                              )));
                },
                child: tileContainer("Budapest")),
            TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                city: 'Ohrid',
                              )));
                },
                child: tileContainer("Ohrid")),
          ],
        ),
      ),
    )
  ]);
}

Widget tileContainer(String city) {
  return Container(
      child: ListTile(
        leading: Icon(
          Icons.arrow_right_rounded,
          size: 40,
        ),
        title: Text(
          city,
          style: TextStyle(fontSize: 20),
        ),
        tileColor: semiBlue,
        focusColor: darkBlue,
        hoverColor: darkBlue,
      ),
      color: darkBlue);
}
