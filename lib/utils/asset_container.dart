import 'package:flutter/cupertino.dart';

import '../constants.dart';

Widget assetContainer(String asset){
  Image image = Image.asset(asset, height: 10, width: 10);
 return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: darkBlue,
        image: DecorationImage(
          alignment: Alignment.topLeft,
          image: image.image,
          scale:0.01,
          //fit: BoxFit.contain,
        ),));
}