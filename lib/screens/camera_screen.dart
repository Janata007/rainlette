import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rainlette/utils/asset_container.dart';

import '../constants.dart';
import 'main_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File _image = File('');
  final ImagePicker imagePicker = getImagePicker();

  Future getImage() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(children: <Widget>[
          Text("Return to main ->", style: TextStyle(fontSize: 17, color: lightGray),)
        ],),
        backgroundColor: darkBlue,
        actions: [
          IconButton(onPressed: (){
            redirectToHome();
          }, icon: Icon(Icons.account_circle_rounded)),
          assetContainer("assets/run.gif")
        ],
      ),
      body: Center(
        child: _image == null
            ? Text("No image has been selected")
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        backgroundColor: lightGray,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
  void redirectToHome() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainScreen(weatherData: mainWeatherData)));
  }
}

ImagePicker getImagePicker() {
  return ImagePicker();
}
