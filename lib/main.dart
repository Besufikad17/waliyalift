import 'package:flutter/material.dart';
import 'package:waliyalift/components/text.dart';
import 'package:waliyalift/screens/home.dart';
import 'package:waliyalift/utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waliya Lift',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: getColorFromHex("#165214")),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Waliya Lift'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { 

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: MyText(
          text: widget.title, 
          size: 12, 
          bgcolor: colorToHexString(Theme.of(context).colorScheme.primary), 
          fgcolor: "#ffffff",
          isBold: true,
          borderRadius: 0
        ),
        centerTitle: true,
      ),
      body: const Home()
    );
  }
}