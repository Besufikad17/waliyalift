import 'package:waliyalift/models/vehicle.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:waliyalift/utils/exceptions.dart';

class VehicleRepository {
  Future<List<Vehicle>> fetchVehicles() async {
    List<Vehicle> vehicles = [];
    final response = await http
        .get(Uri.parse('http://amircreations.com/walya/get_all_prices.php'));

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body)["responseCode"];
      for (var element in res) {
        vehicles.add(Vehicle.fromJSON(element));
      }
    } else {
      throw CannotLoadVehiclesException('Failed to load Vehicles');
    }

    return vehicles;
  }  
}