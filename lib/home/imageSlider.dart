import 'package:flutter/cupertino.dart';

class ImageSlider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        "images/blue_t_shirt.jpg",
        height: double.parse("180"),
        alignment: Alignment.center,
        fit: BoxFit.cover,
      ),
    );
  }


}