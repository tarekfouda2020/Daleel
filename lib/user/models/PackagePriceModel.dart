
class PackagePriceModel {
  PackagePriceModel({
    required this.numberOfBookingsPerDay,
    required this.id,
    required this.name,
    required this.nameAr,
    required this.description,
    required this.descriptionAr,
    required this.numberOfPersons,
    required this.packagePrice,
    required this.createdAt,
    required this.updatedAt,
    required this.isAvailable,
  });

  int numberOfBookingsPerDay;
  String id;
  String name;
  String nameAr;
  String description;
  String descriptionAr;
  int numberOfPersons;
  int packagePrice;
  DateTime createdAt;
  DateTime updatedAt;
  bool isAvailable;

  factory PackagePriceModel.fromMap(Map<String, dynamic> json) => PackagePriceModel(
    numberOfBookingsPerDay: json["numberOfBookingsPerDay"],
    id: json["_id"],
    name: json["name"],
    nameAr: json["name_ar"],
    description: json["description"],
    descriptionAr: json["description_ar"],
    numberOfPersons: json["numberOfPersons"],
    packagePrice: json["packagePrice"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isAvailable: json["is_available"],
  );

  Map<String, dynamic> toMap() => {
    "numberOfBookingsPerDay": numberOfBookingsPerDay,
    "_id": id,
    "name": name,
    "name_ar": nameAr,
    "description": description,
    "description_ar": descriptionAr,
    "numberOfPersons": numberOfPersons,
    "packagePrice": packagePrice,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "is_available": isAvailable,
  };
}
