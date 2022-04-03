import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainlette/screens/main_screen.dart';
import 'package:rainlette/screens/widgets/buttons_widget.dart';

import '../constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        ),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                child: logo,
                width: 100,
              )
            ]),
            SizedBox(
              height: 15,
            ),
            Text(
              "Profile",
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold, color: darkBlue),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                width: 500,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(color: Colors.white, width: 4),
                  image: DecorationImage(
                    alignment: Alignment.topRight,
                    image: logo.image,
                    scale: 3,
                    //fit: BoxFit.contain,
                  ),
                  color: darkBlue,
                ),
                child: SingleChildScrollView(child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Username",
                      style: TextStyle(color: lightBlue, fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "insert username here",
                      style: TextStyle(color: lightBlue),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Change username",
                              style: TextStyle(color: lightBlue),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Change password",
                              style: TextStyle(color: lightBlue),
                            )),
                      ],
                    ),
                  ],
                ),),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 500,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
                color: darkBlue,
                border: Border.all(color: Colors.white, width: 5),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Location",
                    style: TextStyle(color: lightBlue, fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Skopje",
                    style: TextStyle(color: lightBlue),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            myButtons(context)
          ],
        ),
      ),
    );
  }
}
