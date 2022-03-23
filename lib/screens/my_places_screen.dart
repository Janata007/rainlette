import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainlette/screens/loading.dart';
import 'package:rainlette/screens/widgets/buttons_widget.dart';
import 'package:rainlette/screens/widgets/city_info_widget.dart';
import 'package:rainlette/utils/asset_container.dart';
import '../constants.dart';

class MyPlacesScreen extends StatefulWidget {
  const MyPlacesScreen({Key? key}) : super(key: key);

  @override
  _MyPlacesScreenState createState() => _MyPlacesScreenState();
}

class _MyPlacesScreenState extends State<MyPlacesScreen> {
  final pref = getSharedPreferences();

  @override
  void initState() {
    super.initState();
  }

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
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.topLeft, height: 90, child: logo)
                  ]),
              const SizedBox(
                height: 48.0,
              ),
              singleCity("Skopje"),
              const SizedBox(height: 15.0),
              singleCity("Skopje"),
              const SizedBox(
                height: 15,
              ),
              singleCity("Ohrid"),
              const SizedBox(
                height: 15,
              ),
              singleCity("Budapest"),
              const SizedBox(
                height: 15,
              ),
              singleCity("Traverse City"),
              const SizedBox(
                height: 15,
              ),
              myButtons(context)
            ])));
  }

  void redirectToHome() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoadingScreen()));
  }
}
