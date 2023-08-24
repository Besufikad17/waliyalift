import 'package:flutter/material.dart';
import 'package:waliyalift/components/vehicle_picker.dart';
import 'package:waliyalift/utils/color.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class Vehicles extends StatelessWidget {
  const Vehicles({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: getColorFromHex("#ffffff"),
        title: const Text("Pick vehicle", style: TextStyle(fontSize: 15),),
        centerTitle: true,
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 16,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.4, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: const Center(
          // TODO: google maps
          child: Text('This widget is below the SlidingSheet'),
        ),
        builder: (context, state) {
          return VehiclePicker();
        },
      ),
    );
  }
}