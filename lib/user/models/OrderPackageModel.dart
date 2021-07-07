

class OrderPackageModel {
  OrderPackageModel({
    required this.numberOfBookingsPerDay,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.nameAr,
    required this.description,
    required this.descriptionAr,
    required this.numberOfPersons,
    required this.packagePrice,
  });

  int numberOfBookingsPerDay;
  DateTime createdAt;
  DateTime updatedAt;
  String id;
  String name;
  String nameAr;
  String description;
  String descriptionAr;
  int numberOfPersons;
  int packagePrice;

  factory OrderPackageModel.fromMap(Map<String, dynamic> json) => OrderPackageModel(
    numberOfBookingsPerDay: json["numberOfBookingsPerDay"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    id: json["_id"],
    name: json["name"],
    nameAr: json["name_ar"],
    description: json["description"],
    descriptionAr: json["description_ar"],
    numberOfPersons: json["numberOfPersons"],
    packagePrice: json["packagePrice"],
  );

  Map<String, dynamic> toMap() => {
    "numberOfBookingsPerDay": numberOfBookingsPerDay,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "_id": id,
    "name": name,
    "name_ar": nameAr,
    "description": description,
    "description_ar": descriptionAr,
    "numberOfPersons": numberOfPersons,
    "packagePrice": packagePrice,
  };
}