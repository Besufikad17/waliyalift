part of 'place_bloc.dart';

abstract class PlaceState extends Equatable {
  const PlaceState();
}

final class PlaceInitial extends PlaceState {
  const PlaceInitial();

  @override
  List<Object?> get props => [];
}

final class PlacesLoaded extends PlaceState {
  final List<Place> places;
  const PlacesLoaded(this.places);

  @override
  List<Object?> get props => [places];
} 

final class PlaceError extends PlaceState {
  final String message;
  const PlaceError(this.message);

  @override
  List<Object?> get props => [message];
}
