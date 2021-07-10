class SubCategoryModel {
  SubCategoryModel({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String category;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory SubCategoryModel.fromMap(Map<String, dynamic> json) => SubCategoryModel(
    id: json["_id"],
    name: json["name"],
    category: json["category"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
    "category": category,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "__v": v,
  };

  @override
  String toString() {
    return name;
  }
}