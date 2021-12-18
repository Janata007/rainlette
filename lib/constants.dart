import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const semiBlue = Color.fromRGBO(143,167,196,1);
const  lightBlue = Color.fromRGBO(210,236,249,1);
const lightGray = Color.fromRGBO(216,220,220, 1);
const darkBlue =Color.fromRGBO(36,60,108,1);
final logo = Image.asset("assets/logo_nogb.png",
    width: 180, height: 180);

const kLinearGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [darkBlue, lightBlue],
);

Icon kCloudIcon = Icon(
  FontAwesomeIcons.cloud,
  size: 75.0,
  color: darkBlue
);

Icon kSunIcon = Icon(
  FontAwesomeIcons.sun,
  size: 75.0,
  color: darkBlue,
);

Icon kMoonIcon = Icon(
  FontAwesomeIcons.moon,
  size: 75.0,
  color: darkBlue,
);