import 'package:flutter/cupertino.dart';
import 'package:rainlette/constants.dart';

Widget singleCity(String city){
  return  Container(
    padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: darkBlue,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
        Text(city, style: TextStyle(),)
        ],
      )
  );
}