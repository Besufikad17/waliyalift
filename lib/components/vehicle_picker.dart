import 'package:flutter/material.dart';
import 'package:waliyalift/components/alert.dart';
import 'package:waliyalift/components/button.dart';
import 'package:waliyalift/components/card.dart';
import 'package:waliyalift/components/text.dart';
import 'package:waliyalift/models/place.dart';
import 'package:waliyalift/models/vehicle.dart';
import 'package:waliyalift/screens/checkout.dart';

class VehiclePicker extends StatefulWidget {
  const VehiclePicker({super.key, required this.vehicles, required this.src, required this.dest});

  final List<Vehicle> vehicles;
  final Place src;
  final Place dest;

  @override
  State<VehiclePicker> createState() => _VehiclePickerState(vehicles: vehicles, src: src, dest: dest);
}

class _VehiclePickerState extends State<VehiclePicker> {
  final List<Vehicle> vehicles;
  final Place src;
  final Place dest;
  Vehicle? vehicle;
  int? selectedIndex;

  _VehiclePickerState({required this.src, required this.dest, required this.vehicles});
  
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
                  borderRadius: 5, 
                  onPressed: (){
                    pick(v);
                  }, 
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: MyText(
                          text: v.name!, 
                          size: 13
                        ),
                      ),
                      Expanded(
                        child: Row(children: [
                          MyText(
                          text: v.capacity!, 
                          size: 13
                        ),
                        Image.asset(
                          "assets/images/person.png",
                          height: 20,
                          width: 20,
                        ),
                        ],),
                      ),
                      Expanded(
                        child: MyText(
                          text: "${v.kmPrice!} birr", 
                          size: 13
                        ),
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
             if(vehicle != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckoutPage(src: src, dest: dest, vehicle: vehicle!,)) 
              );
             }else {
              _displayAlert(AlertType.error, const Text("Please select vehicle type"), "Error");
             }
            }
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }

  void _displayAlert(AlertType type, Widget body, String title) {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return MyAlert(title: title, type: type, body: body);
      }
    );
  }
}