import 'dart:io';

import 'package:flutter/material.dart';
import 'package:waliyalift/components/text.dart';
import 'package:waliyalift/screens/home.dart';
import 'package:waliyalift/utils/color.dart';
import 'package:window_size/window_size.dart';

import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMaxSize(const Size(360, 800));
    setWindowMinSize(const Size(360, 800));
  }

   final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
  }

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
          color: "#ffffff",
          isBold: true,
        ),
        centerTitle: true,
      ),
      body: const Home()
    );
  }
}
