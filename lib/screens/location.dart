import 'package:flutter/material.dart';
import 'package:waliyalift/components/alert.dart';
import 'package:waliyalift/components/button.dart';
import 'package:waliyalift/components/card.dart';
import 'package:waliyalift/components/location_picker.dart';
import 'package:waliyalift/components/text.dart';
import 'package:waliyalift/models/place.dart';
import 'package:waliyalift/screens/vehicles.dart';
import 'package:waliyalift/utils/color.dart';


class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String borderColor = "#000000";
  String pickLocation = "Pick location";
  String dropLocation = "Drop location";
  late Place src;
  late Place dest;

  void pick(Place location, flag) {
    if (flag == "pick") {
        setState(() {
          pickLocation = location.toString();
          src = location;
        });
    }else {
        setState(() {
          dropLocation = location.toString();
          dest = location;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: MyText(
            text: "Pick Location",
            size: 12,
            color: "#ffffff",
            isBold: true,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/location.png',
            height: 180,
            width: 180,
          ),
          const SizedBox(
            height: 20,
          ),
          MyCard(
            width: 250,
            height: 50,
            borderRadius: 5,
            onPressed: () => {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => LocationPicker(
                  flag: "pick",
                  onPressed: (Place location, flag) => pick(location, "pick"),
                ))
              )
            },
            borderColor: borderColor,
            widget: Container(
              padding: const EdgeInsets.all(6),
              color: getColorFromHex("#ffffff"),
              child: Row(children: [
                Expanded(
                  child: MyText(
                      text: pickLocation,
                      size: 12,
                  ),
                ),
                const SizedBox(
                  width: 115,
                ),
                Image.asset(
                  "assets/images/location-icon.png",
                  height: 20,
                  width: 20,
                )
              ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyCard(
            width: 250,
            height: 50,
            borderRadius: 5,
            borderColor: borderColor,
            onPressed: () => {
             Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => LocationPicker(
                  flag: "drop",
                  onPressed: (Place location, flag) => pick(location, "drop"),
                ))
              )
            },
            widget: Container(
              padding: const EdgeInsets.all(4),
              color: getColorFromHex("#ffffff"),
              child: Row(children: [
                Expanded(
                  child: MyText(
                      text: dropLocation,
                      size: 12,
                    ),
                ),
                const SizedBox(
                  width: 113,
                ),
                Image.asset(
                  "assets/images/location-icon.png",
                  height: 20,
                  width: 20,
                )
              ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(
              text: "Next",
              width: 250,
              height: 40,
              borderRadius: 5,
              bgcolor: "#165214",
              onPressed: () {
                if(pickLocation != "Pick location" && dropLocation != "Drop location") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (Vehicles(src: src, dest: dest,)))
                  );
                }else if(pickLocation == "Pick location" || dropLocation == "Drop location") {
                    _displayAlert(
                      AlertType.error, 
                      const Text("Please pick location"), 
                      "Error"
                    );
                }
              })
        ]),
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
