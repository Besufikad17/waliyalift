import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    required this.textEditingController, 
    required this.labelText, 
    required this.hintText,
    required this.onChanged
  });

  final TextEditingController textEditingController;
  final String labelText;
  final String hintText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(  
      controller: textEditingController,  
      decoration: InputDecoration(  
        border: const OutlineInputBorder(),  
        labelText: labelText,  
        hintText: hintText,  
      ),
      onChanged: (query) => onChanged(query),
    );
  }
}