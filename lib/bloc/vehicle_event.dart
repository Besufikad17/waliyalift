part of 'vehicle_bloc.dart';

abstract class VehicleEvent extends Equatable {
  const VehicleEvent();
}

class GetVehicles extends VehicleEvent {
  const GetVehicles();
  
  @override
  List<Object?> get props => [];
}
