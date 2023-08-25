import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waliyalift/models/vehicle.dart';
import 'package:waliyalift/repository/vehicle_repository.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final VehicleRepository _vehicleRepository;

  VehicleBloc(this._vehicleRepository) : super(const VehicleInitial()) {
    on<GetVehicles>((event, emit) async {
      final vehicles = await _vehicleRepository.fetchVehicles();
      emit(VehiclesLoaded(vehicles));
    });
  }
}
