class Vehicle {
  String? id;
  String? name;
  String? capacity;
  String? startPrice;
  String? kmPrice;

  Vehicle({
    this.id,
    this.name,
    this.capacity,
    this.startPrice,
    this.kmPrice
  });

  factory Vehicle.fromJSON(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      name: json['name'],
      capacity: json['capacity'],
      startPrice: json['start_price'],
      kmPrice: json['km_price']
    );
  }

}