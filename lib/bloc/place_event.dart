part of 'place_bloc.dart';

abstract class PlaceEvent extends Equatable {
  const PlaceEvent();
}

class GetPlaces extends PlaceEvent {
  const GetPlaces();

  @override
  List<Object?> get props => [];
}

class UpdatePlaces extends PlaceEvent {
  List<Place> newPlaces;
  UpdatePlaces(this.newPlaces);

  @override
  List<Object?> get props => [newPlaces];
}
