import 'package:waliyalift/models/place.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:waliyalift/utils/exceptions.dart';

class PlaceRepository {
  Future<List<Place>> fetchPlaces() async {
    List<Place> places = [];
    final response = await http.get(Uri.parse('http://amircreations.com/walya/get_all_places.php'));

    if(response.statusCode == 200) {
      var res = jsonDecode(response.body)["response"];
      for(var element in res) {
        places.add(Place.fromJSON(element));
      }
    }else {
      throw CannotLoadPlacesException('Failed to load places');
    }

    return places;
  }
}
