
class PackageDataModel {
  PackageDataModel({
    required this.numberOfBookingsPerDay,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.nameAr,
    required this.description,
    required this.descriptionAr,
    required this.minimumCount,
    required this.maximumCount,
    required this.pricePerPerson,
  });

  int numberOfBookingsPerDay;
  DateTime createdAt;
  DateTime updatedAt;
  String id;
  String name;
  String nameAr;
  String description;
  String descriptionAr;
  int minimumCount;
  int maximumCount;
  num pricePerPerson;

  factory PackageDataModel.fromMap(Map<String, dynamic> json) => PackageDataModel(
    numberOfBookingsPerDay: json["numberOfBookingsPerDay"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    id: json["_id"],
    name: json["name"],
    nameAr: json["name_ar"],
    description: json["description"],
    descriptionAr: json["description_ar"],
    minimumCount: json["minimumCount"],
    maximumCount: json["maximumCount"],
    pricePerPerson: json["pricePerPerson"],
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
    "minimumCount": minimumCount,
    "maximumCount": maximumCount,
    "pricePerPerson": pricePerPerson,
  };
}
