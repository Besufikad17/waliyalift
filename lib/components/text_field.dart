import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({super.key, 
    required this.textEditingController, 
    required this.labelText, 
    required this.hintText,
    required this.onChanged,
    required this.onSubmitted,
    this.fontSize = 13
  });

  final TextEditingController textEditingController;
  final String labelText;
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  double fontSize;


  @override
  Widget build(BuildContext context) {
    return TextField(  
      textInputAction: TextInputAction.search,
      onSubmitted: onSubmitted,
      controller: textEditingController,  
      style: TextStyle(fontSize: fontSize),
      decoration: InputDecoration(  
        border: const OutlineInputBorder(),  
        labelText: labelText,  
        hintText: hintText,  
      ),
      onChanged: (query) => onChanged(query),
    );
  }
}