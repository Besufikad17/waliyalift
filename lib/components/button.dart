import 'package:flutter/material.dart';
import 'package:waliyalift/utils/color.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback onPressed;
  String? bgcolor;
  double? borderRadius;
  String? fgcolor;
  double? fontSize;

  MyButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    this.bgcolor,
    this.borderRadius,
    this.fgcolor,
    this.fontSize,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgcolor != null ? getColorFromHex(bgcolor!) : Theme.of(context).iconTheme.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
        ),
        child: Text(
          text, 
          style: TextStyle(
            color: fgcolor != null ? getColorFromHex(fgcolor!) : Theme.of(context).colorScheme.onPrimary,
            fontSize: fontSize
          )
        ),
      ),
    );
  }
}