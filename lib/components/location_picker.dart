// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:waliyalift/components/text.dart';
import 'package:waliyalift/models/place.dart';
import 'package:waliyalift/utils/color.dart';
import 'package:waliyalift/utils/data.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationPicker extends HookConsumerWidget {
  LocationPicker({
    super.key, 
    required this.places, 
    required this.onPressed, 
    required this.flag
  });

  final List<Place> places;
  final Function(String, String) onPressed;
  final String flag;

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cityState = useState(getFullAdress(places));
    List<String> cities = cityState.value;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: MyText(
            text: "$flag location",
            size: 12,
            bgcolor: colorToHexString(Theme.of(context).colorScheme.primary),
            fgcolor: "#ffffff",
            isBold: true,
            borderRadius: 0),
        centerTitle: true,
      ),
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(  
                controller: search,  
                decoration: const InputDecoration(  
                  border: OutlineInputBorder(),  
                  labelText: 'Place',  
                  hintText: 'Search place..',  
                ), 
                onChanged: (query) {
                  List<String> result = [];
                  if(query.isEmpty){ 
                    cityState.value = getFullAdress(places);
                  }else {
                    for(var place in cities) {
                      if(place.toLowerCase().contains(query.toLowerCase())){
                        result.add(place);
                      }
                    }
                    cityState.value = result;
                  }
                }, 
              ),
            ),  
            Expanded(
              child: cities.isEmpty ? 
                const Text("No data found :(")
               : 
                ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: const Icon(Icons.location_on),
                        title: GestureDetector(
                          onTap: () {
                            onPressed(cities[index], flag);
                            Navigator.pop(context);
                          },
                          child: Text(cities[index])
                        ),
                    );
                  },
                  shrinkWrap: true,
                ),
            ),
          ]
        ),
    );
  }
}
