import 'package:flutter/material.dart';

class MyCircularProgressBar extends StatelessWidget {
  const MyCircularProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}