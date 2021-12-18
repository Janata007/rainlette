import 'package:flutter/material.dart';
import 'package:rainlette/screens/loading.dart';
import 'package:rainlette/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}