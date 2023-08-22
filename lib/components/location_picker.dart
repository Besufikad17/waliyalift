import 'package:flutter/material.dart';
import 'package:waliyalift/models/place.dart';
import 'package:waliyalift/utils/data.dart';

class LocationPicker extends StatelessWidget {
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
  Widget build(BuildContext context) {
    List<String> cities = getFullAdress(places);
    return Column(
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
                  cities = getFullAdress(places);
                }else {
                  for(var place in cities) {
                    if(place.toLowerCase().contains(query.toLowerCase())){
                      result.add(place);
                    }
                  }
                  cities = result;
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
                }
              ),
          ),
        ]
      );
  }
}
