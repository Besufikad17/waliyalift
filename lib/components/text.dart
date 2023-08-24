import 'package:flutter/material.dart';
import 'package:waliyalift/utils/color.dart';

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  final String text;
  final double size;
  bool isBold;
  double width;
  String color;

  MyText({
    super.key,
    required this.text,
    required this.size,
    this.isBold = false,
    this.width = 0,
    this.color = "#000000"
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        fontSize: size,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
        color: getColorFromHex(color),
      ),
      textAlign: TextAlign.center
    );
  }
}
