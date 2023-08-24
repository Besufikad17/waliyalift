import 'package:flutter/material.dart';
import 'package:waliyalift/components/button.dart';
import 'package:waliyalift/components/card.dart';
import 'package:waliyalift/components/text.dart';
import 'package:waliyalift/models/border_radius.dart';
import 'package:waliyalift/models/vehicle.dart';

class VehiclePicker extends StatefulWidget {
  const VehiclePicker({super.key});

  @override
  State<VehiclePicker> createState() => _VehiclePickerState();
}

class _VehiclePickerState extends State<VehiclePicker> {
  late Vehicle vehicle;
  int? selectedIndex;

  // TODO: use vehicle bloc
  List<Vehicle> vehicles = [
    Vehicle(id: "1", name: "Micro", capacity: "4", startPrice: "95", kmPrice: "12"),
    Vehicle(id: "1", name: "Micro", capacity: "4", startPrice: "95", kmPrice: "12"),
    Vehicle(id: "1", name: "Micro", capacity: "4", startPrice: "95", kmPrice: "12"),
    Vehicle(id: "1", name: "Micro", capacity: "4", startPrice: "95", kmPrice: "12"),
  ];

  void pick(Vehicle newVehicle) {
    setState(() {
      vehicle = newVehicle;
      selectedIndex = vehicles.indexOf(newVehicle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Column(
        children: [
          const SizedBox(height: 40,),
          ...(vehicles.map((v) =>
            Padding(
              padding: const EdgeInsets.all(10),
              child: (
                MyCard(
                  width: 300,
                  height: 50,
                  borderColor: selectedIndex != null ? (vehicles.indexOf(v) == selectedIndex ? "#165214" : "#000000") : "#000000",
                  borderRadius: MyBorderRadius.all(radius: 5), 
                  onPressed: (){
                    pick(v);
                  }, 
                  widget: Row(
                    children: [
                      const SizedBox(width: 10,),
                      MyText(
                        text: v.name!, 
                        size: 13
                      ),
                      const SizedBox(width: 40,),
                      Image.asset(
                        "assets/images/person.png",
                        height: 20,
                        width: 20,
                      ),
                      MyText(
                        text: v.capacity!, 
                        size: 13
                      ),
                      const SizedBox(width: 110,),
                      MyText(
                        text: "${v.kmPrice!} birr", 
                        size: 13
                      ),
                    ],
                  )
                )
              ),
            ))
          ),
          const SizedBox(height: 20,),
          MyButton(
            text: "Done", 
            width: 200, 
            height: 40,
            bgcolor: "#165214", 
            borderRadius: 5,
            onPressed: () {
              // TODO: Navigate to checkout page
            }
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}