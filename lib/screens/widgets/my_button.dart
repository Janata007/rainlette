import 'package:flutter/material.dart';
import 'package:rainlette/constants.dart';

class MyButton extends Padding {
  MyButton({required String label, required VoidCallback onPressed})
      : super(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
          borderRadius: BorderRadius.circular(30.0),
          shadowColor: darkBlue,
          elevation: 5.0,
          color: darkBlue,
          child: MaterialButton(
            minWidth: 200.0,
            height: 42.0,
            onPressed: onPressed,
            child: Text((label),
                style: TextStyle(fontSize: 18.0, color: lightGray)),
          )));
}