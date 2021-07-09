class CityModel {
  CityModel({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory CityModel.fromMap(Map<String, dynamic> json) => CityModel(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
  };

  @override
  String toString() {
    return name;
  }
}