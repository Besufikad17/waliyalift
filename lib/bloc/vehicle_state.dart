part of 'vehicle_bloc.dart';

abstract class VehicleState extends Equatable {
  const VehicleState();
}

final class VehicleInitial extends VehicleState {
  const VehicleInitial();

  @override
  List<Object?> get props => [];
}

final class VehiclesLoaded extends VehicleState {
  final List<Vehicle> vehicles;
  const VehiclesLoaded(this.vehicles);
  
  @override
  List<Object?> get props => [vehicles];
}

final class VehicleError extends VehicleState {
  final String message;
  const VehicleError(this.message);
  
  @override
  List<Object?> get props => [message];
}
