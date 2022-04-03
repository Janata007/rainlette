import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainlette/screens/loading.dart';
import 'package:rainlette/screens/widgets/buttons_widget.dart';
import 'package:rainlette/utils/asset_container.dart';

import '../constants.dart';
import 'home_screen.dart';

class MyPlacesScreen extends StatefulWidget {
  const MyPlacesScreen({Key? key}) : super(key: key);

  @override
  _MyPlacesScreenState createState() => _MyPlacesScreenState();
}

class _MyPlacesScreenState extends State<MyPlacesScreen> {
  final pref = getSharedPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: semiBlue,
        appBar: AppBar(
          title: Text(
            "My PLaces",
            style: TextStyle(color: lightBlue),
          ),
          backgroundColor: darkBlue,
          actions: [assetContainer("assets/duck.gif")],
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: citiesList.length,
                itemBuilder: singleCity,
              )),
              myButtons(context),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  void redirectToHome() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoadingScreen()));
  }
}

Widget singleCity(context, int index) {
  return Column(
    children: [
      Container(
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(citiesList[index], style: TextStyle(fontSize: 20)),
              SizedBox(
                width: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(
                                  city: citiesList[index],
                                )));
                  },
                  child: Icon(
                    Icons.cloud_circle_outlined,
                    size: 40,
                    color: Colors.white,
                  )),
              SizedBox(
                width: 20,
              ),
            ],
          )),
      SizedBox(
        height: 20,
      )
    ],
  );
}
