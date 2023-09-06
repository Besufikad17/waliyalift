import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waliyalift/bloc/vehicle_bloc.dart';
import 'package:waliyalift/components/circular_progress.dart';
import 'package:waliyalift/components/map.dart';
import 'package:waliyalift/components/vehicle_picker.dart';
import 'package:waliyalift/models/place.dart';
import 'package:waliyalift/models/vehicle.dart';
import 'package:waliyalift/repository/vehicle_repository.dart';
import 'package:waliyalift/utils/color.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class Vehicles extends StatelessWidget {
  Vehicles({super.key, required this.src, required this.dest});

  final VehicleRepository _vehicleRepository = VehicleRepository();
  final Place src;
  final Place dest;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: getColorFromHex("#ffffff"),
        title: const Text("Pick vehicle", style: TextStyle(fontSize: 15),),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => VehicleBloc(_vehicleRepository)..add(const GetVehicles()),
        child: BlocConsumer<VehicleBloc, VehicleState>(
          listener: (context, state) => {},
          builder: (BuildContext context, VehicleState state) {
            if(state is VehicleInitial) {
              return const MyCircularProgressBar();
            }else if(state is VehiclesLoaded) {
              return _loadVehicles(state.vehicles);
            }else if(state is VehicleError) {
              return _loadError(state.message);
            }
            return Container();
          },
        ),
      )
    );
  }

  Widget _loadError(String message) {
     return Center(
      child: Text(message),
    );
  }

  Widget _loadVehicles(List<Vehicle> vehicles) {
    return SlidingSheet(
        elevation: 8,
        cornerRadius: 16,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.4, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: MyMap(
          src: src,
          dest: dest,
        ),
        builder: (context, state) {
          return VehiclePicker(vehicles: vehicles, src: src, dest: dest,);
        },
      );
  }
}