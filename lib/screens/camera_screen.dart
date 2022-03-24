// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../constants.dart';
//
// class CameraScreen extends StatefulWidget {
//   const CameraScreen({Key? key}) : super(key: key);
//
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }
//
// class _CameraScreenState extends State<CameraScreen> {
//   late File _image;
//   final ImagePicker imagePicker = getImagePicker();
//
//   Future getImage() async {
//     final image = await imagePicker.getImage(source: ImageSource.camera);
//     setState(() {
//       _image = File(image!.path);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Welcome to Rainlette",
//           style: TextStyle(color: lightBlue),
//         ),
//         backgroundColor: darkBlue,
//       ),
//       body: Center(
//         child: _image == null
//             ? Text("No image has been selected")
//             : Image.file(_image),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: getImage,
//         backgroundColor: lightGray,
//         child: Icon(Icons.camera_alt),
//       ),
//     );
//   }
// }
//
// ImagePicker getImagePicker() {
//   return ImagePicker();
// }
