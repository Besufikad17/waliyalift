import 'package:flutter/material.dart';

enum AlertType {
  message,
  error,
}

class MyAlert extends StatelessWidget {
  const MyAlert({super.key, required this.title, required this.type, required this.body});

  final String title;
  final AlertType type;
  final Widget body;
  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: type == AlertType.message ? 
      Text(title) :
      Text(title, style: const TextStyle(color: Colors.red)),
      content: body,
    );
  }
}