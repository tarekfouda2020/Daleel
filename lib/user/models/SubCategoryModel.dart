class SubCategoryModel {
  SubCategoryModel({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory SubCategoryModel.fromMap(Map<String, dynamic> json) => SubCategoryModel(
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