import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:waliyalift/models/place.dart';

class MyMap extends StatefulWidget {
  final Place src;
  final Place dest;

  const MyMap({super.key, required this.src, required this.dest});

  @override
  State<MyMap> createState() => _MyMapState(src: src, dest: dest);
}

class _MyMapState extends State<MyMap> {
  final Place src;
  final Place dest;
  
  _MyMapState({required this.src, required this.dest});

  List<LatLng> polylineCoordinates = [];
  final String googleApiKey = "AIzaSyBECLXwTxcTxE6AIV6V1a_48gSjWyh7T_U";

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey, 
      PointLatLng(double.parse(src.lat!), double.parse(src.lng!)), 
      PointLatLng(double.parse(dest.lat!), double.parse(dest.lng!))
    );

    if(result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude)
        );
      }
    }
  }

  @override
  void initState(){
    // getPolyPoints();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    LatLng srcLocation = LatLng(double.parse(src.lat!), double.parse(src.lng!));
    LatLng destLocation = LatLng(double.parse(dest.lat!), double.parse(dest.lng!));

    return GoogleMapsWidget(
      compassEnabled: true,
      indoorViewEnabled: true,
      buildingsEnabled: true,
      apiKey: googleApiKey,
      sourceLatLng: srcLocation,
      destinationLatLng: destLocation,
      defaultCameraZoom: 12,
      routeWidth: 4,
      routeColor: Colors.black,
      totalTimeCallback: (time) => {
        print(time)
      },
      totalDistanceCallback: (distance) => {
        print(distance)
      },
    );
  }
}