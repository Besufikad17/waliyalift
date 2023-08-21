import 'package:flutter/material.dart';
import 'package:waliyalift/utils/color.dart';

class MyCard extends StatelessWidget {
  MyCard({
    super.key, 
    required this.width, 
    required this.height, 
    required this.borderRadius, 
    required this.onPressed, 
    required this.widget, 
    this.borderColor="#000000"
  });

  final double width;
  final double height;
  final double borderRadius;
  final VoidCallback onPressed;
  final Widget widget;
  String borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        onPressed()
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius), ),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: getColorFromHex(borderColor),
              width: borderColor != "#000000" ? 2 : 1,
            ),           
            borderRadius: BorderRadius.circular(borderRadius)
          ),
          child: widget,
        )
      ),
    );
  }
}