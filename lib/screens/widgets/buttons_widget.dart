import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

Widget myButtons(){
  return
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: (){}, child:
        Container(decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ), padding: EdgeInsets.all(6),
            child: Text("Home", style: TextStyle(color: lightBlue, fontSize: 18),
            ))),
        TextButton(onPressed: (){}, child:
        Container(decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ), padding: EdgeInsets.all(6),
            child: Text("My places", style: TextStyle(color: lightBlue, fontSize: 18),
            ))),
        TextButton(onPressed: (){}, child:
        Container(decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ), padding: EdgeInsets.all(6),
            child: Text("Settings", style: TextStyle(color: lightBlue, fontSize: 18),
            ))),
        TextButton(onPressed: (){}, child:
        Container(decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ), padding: EdgeInsets.all(6),
            child: Text("Log out", style: TextStyle(color: lightBlue, fontSize: 18),
            ))),
      ],
    );
}