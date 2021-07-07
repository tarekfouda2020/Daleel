

class OrderLocationModel {
  OrderLocationModel({
    required this.coordinates,
    required this.type,
  });

  List<double> coordinates;
  String type;

  factory OrderLocationModel.fromMap(Map<String, dynamic> json) => OrderLocationModel(
    coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    type: json["type"],
  );

  Map<String, dynamic> toMap() => {
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    "type": type,
  };
}
