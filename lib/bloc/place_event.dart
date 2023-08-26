part of 'place_bloc.dart';

abstract class PlaceEvent extends Equatable {
  const PlaceEvent();
}

class GetPlaces extends PlaceEvent {
  const GetPlaces();

  @override
  List<Object?> get props => [];
}
