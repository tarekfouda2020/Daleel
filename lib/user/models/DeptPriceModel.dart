
class DeptPriceModel {
  DeptPriceModel({
    required this.id,
    required this.name,
    required this.capacity,
    required this.description,
    required this.descriptionAr,
    required this.saturdayPrice,
    required this.sundayPrice,
    required this.mondayPrice,
    required this.tuesdayPrice,
    required this.wednesPrice,
    required this.thursdayPrice,
    required this.fridayPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.isAvailable,
    required this.price,
  });

  String id;
  String name;
  int capacity;
  String description;
  String descriptionAr;
  int saturdayPrice;
  int sundayPrice;
  int mondayPrice;
  int tuesdayPrice;
  int wednesPrice;
  int thursdayPrice;
  int fridayPrice;
  DateTime createdAt;
  DateTime updatedAt;
  bool isAvailable;
  int price;

  factory DeptPriceModel.fromMap(Map<String, dynamic> json) => DeptPriceModel(
    id: json["_id"],
    name: json["name"],
    capacity: json["capacity"],
    description: json["description"],
    descriptionAr: json["description_ar"],
    saturdayPrice: json["saturdayPrice"],
    sundayPrice: json["sundayPrice"],
    mondayPrice: json["mondayPrice"],
    tuesdayPrice: json["tuesdayPrice"],
    wednesPrice: json["wednesPrice"],
    thursdayPrice: json["thursdayPrice"],
    fridayPrice: json["fridayPrice"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isAvailable: json["is_available"],
    price: json["price"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
    "capacity": capacity,
    "description": description,
    "description_ar": descriptionAr,
    "saturdayPrice": saturdayPrice,
    "sundayPrice": sundayPrice,
    "mondayPrice": mondayPrice,
    "tuesdayPrice": tuesdayPrice,
    "wednesPrice": wednesPrice,
    "thursdayPrice": thursdayPrice,
    "fridayPrice": fridayPrice,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "is_available": isAvailable,
    "price": price,
  };
}
