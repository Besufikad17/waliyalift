// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waliyalift/bloc/place_bloc.dart';
import 'package:waliyalift/components/circular_progress.dart';
import 'package:waliyalift/components/text.dart';
import 'package:waliyalift/models/place.dart';
import 'package:waliyalift/repository/place_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationPicker extends HookConsumerWidget {
  LocationPicker({
    super.key, 
    required this.onPressed, 
    required this.flag
  });

  final Function(Place, String) onPressed;
  final String flag;

  TextEditingController search = TextEditingController();
  final PlaceRepository _placeRepository = PlaceRepository();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: MyText(
            text: "$flag location",
            size: 12,
            color: "#ffffff",
            isBold: true,
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => PlaceBloc(_placeRepository)..add(const GetPlaces()),
        child: BlocConsumer<PlaceBloc, PlaceState>(
          listener: (context, state) => {},
          builder: (BuildContext context, PlaceState state) {
            if(state is PlaceInitial) {
              return const MyCircularProgressBar();
            }else if(state is PlacesLoaded) {
              return _loadPlaces(state.places, context.read<PlaceBloc>());
            }else if(state is PlaceError) {
              return _loadError(state.message);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _loadError(String message) {
     return Center(
      child: Text(message),
    );
  }

  Widget _loadPlaces(List<Place> places, PlaceBloc bloc) {
    // var cityState = useState(getFullAdress(places));
    // List<String> cities = cityState.value;

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
                  List<Place> result = [];
                  if(query.isEmpty){ 
                    bloc.add(UpdatePlaces(places));
                  }else {
                    for(var place in places) {
                      if(place.toString().toLowerCase().contains(query.toLowerCase())){
                        result.add(place);
                      }
                    }
                    bloc.add(UpdatePlaces(result));
                  }
                }, 
              ),
            ),  
            Expanded(
              child: places.isEmpty ? 
                const Text("No data found :(")
               : 
                ListView.builder(
                  itemCount: places.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: const Icon(Icons.location_on),
                        title: GestureDetector(
                          onTap: () {
                            onPressed(places[index], flag);
                            Navigator.pop(context);
                          },
                          child: Text(places[index].toString())
                        ),
                    );
                  },
                  shrinkWrap: true,
                ),
            ),
          ]
        );
  }
}
