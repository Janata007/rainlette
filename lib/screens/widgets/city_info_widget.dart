import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        Text(city, style: TextStyle(fontSize: 20)),
          SizedBox(width: 20,),
          Text("12*", style: TextStyle(fontSize: 17),),
          SizedBox(width: 20,),
          Icon(Icons.cloud_circle_outlined, size: 30,)
        ],
      )
  );
}