class CannotLoadVehiclesException implements Exception {
  String cause;
  CannotLoadVehiclesException(this.cause);
}

class CannotLoadPlacesException implements Exception {
  String cause;
  CannotLoadPlacesException(this.cause);
}