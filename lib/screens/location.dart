import 'package:flutter/material.dart';
import 'package:waliyalift/components/button.dart';
import 'package:waliyalift/components/card.dart';
import 'package:waliyalift/components/location_picker.dart';
import 'package:waliyalift/components/text.dart';
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
          borderRadius: 0
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 20,),
          Image.asset(
            'assets/images/location.png',
            height: 180,
            width: 180,
          ),
          const SizedBox(height: 20,),
          MyCard(
          width: 250, 
          height: 50, 
          borderRadius: 5, 
          onPressed: () => {
            showDialog(
              context: context, 
              builder: (BuildContext context) {
                return togglePopup("pick");
              }
            )
          }, 
          borderColor: borderColor,
          widget: Container(
            padding: const EdgeInsets.all(6),
            color: getColorFromHex("#ffffff"),
            child: Row(children: [
               MyText(
                text: pickLocation,
                size: 12,
                bgcolor: "#ffffff",
                borderRadius: 0),
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
        const SizedBox(height: 20,),
        MyCard(
          width: 250, 
          height: 50, 
          borderRadius: 5,
          borderColor: borderColor, 
          onPressed: () => {
            showDialog(
              context: context, 
              builder: (BuildContext context) {
                return togglePopup("drop");
              }
            )
          }, 
          widget: Container(
            padding: const EdgeInsets.all(6),
            color: getColorFromHex("#ffffff"),
            child: Row(children: [
               MyText(
                text: dropLocation,
                size: 12,
                bgcolor: "#ffffff",
                borderRadius: 0),
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
        const SizedBox(height: 20,),
        MyButton(
          text: "Next", 
          width: 250, 
          height: 40, 
          borderRadius: 5,
          bgcolor: "#165214",
          onPressed: () {}
        )
        ]),
      ),
    );
  }

  Widget togglePopup(String flag) {
    return AlertDialog(
      title: Text("$flag location"),
      content: LocationPicker(
        places: [],
        onPressed: (location, flag) => {
          if(flag == "pick") {
            setState((){
              pickLocation = location;
            })
          }else {
            setState((){
              dropLocation = location;
            })
          }
        },
        flag: flag,
      ),
    );
  }
}