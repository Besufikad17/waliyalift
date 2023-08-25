import 'package:flutter/material.dart';
import 'package:waliyalift/components/button.dart';
import 'package:waliyalift/components/card.dart';
import 'package:waliyalift/components/text.dart';
import 'package:waliyalift/components/text_field.dart';
import 'package:waliyalift/screens/location.dart';
import 'package:waliyalift/utils/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String borderColor = "#000000", borderColor2 = "#000000";
  String user = "", phoneNumber = "";
  TextEditingController text = TextEditingController(), pnoText = TextEditingController();

  void tap(int index) {
    if (index == 1) {
      setState(() {
        user = "me";
        borderColor = "#165214";
        borderColor2 = "#000000";
      });
    }else {
      setState(() {
        user = "other";
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
               Expanded(
                 child: MyText(
                  text: "For me",
                  size: 12,
                 ),
               ),
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
            padding: const EdgeInsets.all(4),
            color: getColorFromHex("#ffffff"),
            child: Row(children: [
               Expanded(
                 child: MyText(
                  text: "For others",
                  size: 12,
                 ),
               ),
              const SizedBox(
                width: 130,
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
          onPressed: () => {
            if(user == "me") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Location(),
              ))
            }else if(user == "other") {
              if(phoneNumber == "") {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Contact Information", style: TextStyle(fontSize: 13),),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyTextField(
                            textEditingController: pnoText, 
                            labelText: "Phone number",
                            hintText: "Enter your phone number",
                            onChanged: (pno) => {
                              setState((){
                                phoneNumber = pno;
                              })
                            },
                            onSubmitted: (pno) => {
                              setState((){
                                phoneNumber = pno;
                              }),
                              Navigator.pop(context)
                            }
                          )
                        ],
                    ),
                    );
                  }
                )
              }else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context){ return const Location(); })
                )
              }
            }else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    title: Text("Error", style: TextStyle(color: Colors.red),),
                    content: Text("Please select valid choice!!"),
                  );
                }
              )
            }
          }
        )
      ],),
    );
  }
}