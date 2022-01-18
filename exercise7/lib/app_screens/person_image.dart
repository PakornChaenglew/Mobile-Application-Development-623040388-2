import 'package:flutter/material.dart';

class FlightImageAsset extends StatelessWidget {
  const FlightImageAsset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    AssetImage assetImage = const AssetImage("images/MyPicture.jpg");
    Image image = Image(image: assetImage, width: 600, height: 400);
    return Container(child: image);
  }
}