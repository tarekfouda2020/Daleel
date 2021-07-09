
class PersonPriceModel {
  PersonPriceModel({
   required this.numberOfBookingsPerDay,
   required this.id,
   required this.name,
   required this.nameAr,
   required this.description,
   required this.descriptionAr,
   required this.minimumCount,
   required this.maximumCount,
   required this.pricePerPerson,
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
  int minimumCount;
  int maximumCount;
  int pricePerPerson;
  DateTime createdAt;
  DateTime updatedAt;
  bool isAvailable;

  factory PersonPriceModel.fromMap(Map<String, dynamic> json) => PersonPriceModel(
    numberOfBookingsPerDay: json["numberOfBookingsPerDay"],
    id: json["_id"],
    name: json["name"],
    nameAr: json["name_ar"],
    description: json["description"],
    descriptionAr: json["description_ar"],
    minimumCount: json["minimumCount"],
    maximumCount: json["maximumCount"],
    pricePerPerson: json["pricePerPerson"],
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
    "minimumCount": minimumCount,
    "maximumCount": maximumCount,
    "pricePerPerson": pricePerPerson,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "is_available": isAvailable,
  };
}
