import 'package:flutter/material.dart';
import 'package:waliyalift/components/card.dart';
import 'package:waliyalift/models/border_radius.dart';

class VehiclePicker extends StatelessWidget {
  const VehiclePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCard(
      borderRadius: MyBorderRadius(topLeft: 10, topRight: 10),
      borderColor: "#ffffff", 
      onPressed: () {}, 
      widget: Column(
        children: [
          const Text("Vehicles"),
          const SizedBox(height: 10,),
          MyCard(
            width: 250,
            height: 40,
            borderRadius: MyBorderRadius.all(radius: 5), 
            onPressed: (){}, 
            widget: const Row(
              children: [],
            )
          )
        ],
      )
    );
  }
}