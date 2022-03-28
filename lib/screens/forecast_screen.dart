import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainlette/screens/widgets/buttons_widget.dart';
import 'package:rainlette/screens/widgets/cities_view.dart';

import '../constants.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forecast info",
          style: TextStyle(color: lightBlue),
        ),
        backgroundColor: darkBlue,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [semiBlue, darkBlue],
              begin: Alignment(-1, -0.5),
              end: Alignment(2, 2)),
          color: semiBlue,
        ),
        child:Column(children: [
            Expanded(
              child: ListView.builder(
                itemCount: daysTemp.length,
                itemBuilder: (context, int index){
                  return Card(color: darkBlue,
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                      Text("Date:  " + daysDates[index], style: TextStyle(fontSize: 20),),
                      Text("Temperature:  " + daysTemp[index], style: TextStyle(fontSize: 20),),
                    ],),
                  );
                },
                padding: EdgeInsets.all(15),
              ),
            ),
          myButtons(context)
        ],)
        ),
    );
  }
}
