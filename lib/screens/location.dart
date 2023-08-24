import 'package:flutter/material.dart';
import 'package:waliyalift/components/button.dart';
import 'package:waliyalift/components/card.dart';
import 'package:waliyalift/components/location_picker.dart';
import 'package:waliyalift/components/text.dart';
import 'package:waliyalift/models/border_radius.dart';
import 'package:waliyalift/models/place.dart';
import 'package:waliyalift/screens/vehicles.dart';
import 'package:waliyalift/utils/color.dart';

enum AlertFlag {
  message,
  error,
}
class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String borderColor = "#000000";
  String pickLocation = "Pick location";
  String dropLocation = "Drop location";
  List<Place> places = [
     Place(id: "1", country: "Ethiopia", city: "Addis Ababa", zone: "1", street: "Asmera road", title: "KMU", lat: "12.33", lng: "34.34"),
          Place(id: "1", country: "Ethiopia", city: "Addis Ababa", zone: "2", street: "Megenagna", title: "Metebaber blg", lat: "12.33", lng: "36.34")
  ];

  void pick(location, flag) {
    if (flag == "pick") {
        setState(() {
          pickLocation = location;
        });
    }else {
        setState(() {
          dropLocation = location;
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
            bgcolor: colorToHexString(Theme.of(context).colorScheme.primary),
            fgcolor: "#ffffff",
            isBold: true,
            borderRadius: 0),
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
            borderRadius: MyBorderRadius.all(radius: 5),
            onPressed: () => {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => LocationPicker(
                  places: places,
                  flag: "pick",
                  onPressed: (location, flag) => pick(location, "pick"),
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
                      bgcolor: "#ffffff",
                      borderRadius: 0),
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
            borderRadius: MyBorderRadius.all(radius: 5),
            borderColor: borderColor,
            onPressed: () => {
             Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => LocationPicker(
                  places: places,
                  flag: "drop",
                  onPressed: (location, flag) => pick(location, "drop"),
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
                      bgcolor: "#ffffff",
                      borderRadius: 0),
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
                    MaterialPageRoute(builder: (context) => (const Vehicles()))
                  );
                }else if(pickLocation == "Pick location" || dropLocation == "Drop location") {
                    _displayAlert(
                      AlertFlag.error, 
                      const Text("Please pick location"), 
                      "Error"
                    );
                }
              })
        ]),
      ),
    );
  }

  void _displayAlert(AlertFlag flag, Widget body, String title) {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: flag == AlertFlag.message ? 
          Text(title) :
          Text(title, style: const TextStyle(color: Colors.red)),
          content: body,
        );
      }
    );
  }
}
