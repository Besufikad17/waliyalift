import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:waliyalift/models/place.dart';
import 'package:waliyalift/repository/place_repository.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final PlaceRepository _placeRepository;
  
  PlaceBloc(this._placeRepository) : super(const PlaceInitial()) {
    on<GetPlaces>((event, emit) async {
      try {
        final places = await _placeRepository.fetchPlaces();
        emit(PlacesLoaded(places));
      } catch (e) {
        emit(PlaceError(e.toString()));
      }
    });
  }
}
