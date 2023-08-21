import 'package:flutter/material.dart';
import 'package:waliyalift/components/button.dart';
import 'package:waliyalift/components/card.dart';
import 'package:waliyalift/components/text.dart';
import 'package:waliyalift/utils/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String borderColor = "#000000", borderColor2 = "#000000";

  void tap(int index) {
    if (index == 1) {
      setState(() {
        borderColor = "#165214";
        borderColor2 = "#000000";
      });
    }else {
      setState(() {
        borderColor2 = "#165214";
        borderColor = "#000000";
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const SizedBox(height: 20,),
        Image.asset(
          'assets/images/logo.png',
          height: 180,
          width: 180,
        ),
        const SizedBox(height: 10,),
        MyCard(
          width: 250, 
          height: 50, 
          borderRadius: 5, 
          onPressed: () => tap(1), 
          borderColor: borderColor,
          widget: Container(
            padding: const EdgeInsets.all(6),
            color: getColorFromHex("#ffffff"),
            child: Row(children: [
               MyText(
                text: "For me",
                size: 12,
                bgcolor: "#ffffff",
                borderRadius: 0),
              const SizedBox(
                width: 150,
              ),
              Image.asset(
                "assets/images/person.png",
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
          borderColor: borderColor2, 
          onPressed: () => tap(2), 
          widget: Container(
            padding: const EdgeInsets.all(6),
            color: getColorFromHex("#ffffff"),
            child: Row(children: [
               MyText(
                text: "For others",
                size: 12,
                bgcolor: "#ffffff",
                borderRadius: 0),
              const SizedBox(
                width: 133,
              ),
              Image.asset(
                "assets/images/member.png",
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
          onPressed: () => {}
        )
      ],),
    );
  }
}