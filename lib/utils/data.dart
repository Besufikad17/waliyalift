import 'package:waliyalift/models/place.dart';

List<String> getFullAdress(List<Place> places) {
  return places.map((place) => place.toString()).toList();
}