import 'package:flutter/material.dart';
import 'package:waliyalift/components/card.dart';
import 'package:waliyalift/components/text.dart';
import 'package:waliyalift/models/place.dart';
import 'package:waliyalift/models/vehicle.dart';
import 'package:waliyalift/utils/data.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({
    super.key, 
    required this.src, 
    required this.dest, 
    required this.vehicle
  });

  final Place src;
  final Place dest;
  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    double distance = calculateDistance(
        double.parse(src.lat!), 
        double.parse(src.lng!), 
        double.parse(dest.lat!), 
        double.parse(dest.lng!)
    ).ceilToDouble();
    double price = distance * double.parse(vehicle.kmPrice!) > double.parse(vehicle.startPrice!) ? 
        distance * double.parse(vehicle.kmPrice!) : 
        double.parse(vehicle.startPrice!);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: MyText(
            text: "Checkout",
            size: 12,
            color: "#ffffff",
            isBold: true,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
         const SizedBox(height: 80,),
         Stack(
          children: [
            MyCard(
              borderRadius: 10, 
              onPressed: () {}, 
              width: 300,
              height: 400,
              widget: Column(
                children: [
                  const SizedBox(height: 20,),
                  const Center(
                    child: Text("Checkout"),
                  ),
                  const SizedBox(height: 50,),
                  Row(
                    children: [
                      const SizedBox(width: 30,),
                      MyText(
                        text: "Source: ", 
                        size: 12,
                        isBold: true, 
                        color: "#165214",
                      ),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: MyText(
                            text: src.toString(), 
                            size: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const SizedBox(width: 30,),
                      MyText(
                        text: "Destination: ", 
                        size: 12,
                        isBold: true, 
                        color: "#165214",
                      ),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: MyText(
                            text: dest.toString(), 
                            size: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const SizedBox(width: 30,),
                      MyText(
                        text: "Kms: ", 
                        size: 12,
                        isBold: true, 
                        color: "#165214",
                      ),
                      const SizedBox(width: 45,),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: MyText(
                            text: "$distance KM", 
                            size: 12,
                          ),
                        ),
                      )
                    ],
                   ),
                   const SizedBox(height: 10,),
                  Row(
                    children: [
                      const SizedBox(width: 30,),
                      MyText(
                        text: "Vehicle: ", 
                        size: 12,
                        isBold: true, 
                        color: "#165214",
                      ),
                      const SizedBox(width: 30,),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: MyText(
                            text: vehicle.name!, 
                            size: 12,
                          ),
                        ),
                      )
                    ],
                   ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const SizedBox(width: 30,),
                      MyText(
                        text: "Price: ", 
                        size: 12,
                        isBold: true, 
                        color: "#165214",
                      ),
                      const SizedBox(width: 45,),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: MyText(
                            text: "$price birr", 
                            size: 12,
                          ),
                        ),
                      )
                    ],
                   ),
                ],
              )
            ),
          ],
         )
        ])
      )
    );
  }
}