import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:waliyalift/components/text.dart';
import 'package:waliyalift/components/vehicle_picker.dart';

class Vehicles extends StatelessWidget {
  const Vehicles({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        elevation: 0,
        title: MyText(
            text: "Pick vehicle",
            size: 12,
            bgcolor: "#ffffff",
            fgcolor: "#000000",
            isBold: true,
            borderRadius: 0),
        centerTitle: true,
      ),
      frontLayer: const Column(children: [
        Text("Map.."),
        Text("Map..")
      ],),
      backLayer: const VehiclePicker(),
    );
  }
}