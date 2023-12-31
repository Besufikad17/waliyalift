import 'package:flutter/material.dart';
import 'package:waliyalift/utils/color.dart';

// ignore: must_be_immutable
class MyCard extends StatelessWidget {
  MyCard({
    super.key, 
    this.width = 0, 
    this.height = 0, 
    required this.borderRadius, 
    required this.onPressed, 
    required this.widget, 
    this.borderColor="#000000",
    this.color="#FFFFFF"
  });

  double width;
  double height;
  final double borderRadius;
  final VoidCallback onPressed;
  final Widget widget;
  String borderColor;
  String color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        onPressed()
      },
      child: Container(
        width: width == 0 ? null : width,
        height: height == 0 ? null : height,
        decoration: BoxDecoration(
          color: getColorFromHex(color),
          borderRadius: BorderRadius.circular(borderRadius)
        ),
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