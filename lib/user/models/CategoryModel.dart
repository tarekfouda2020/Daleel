enum CategoriesTypes{
  firstCat,
  secondCat,
  thirdCat,
}

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.isAvailable,
    required this.name,
    required this.tag,
    required this.appPercentage,
    required this.downPaymentPercentage,
    required this.image,
    required this.sorting,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
  });

  String id;
  bool isAvailable;
  String name;
  String tag;
  int appPercentage;
  int downPaymentPercentage;
  String image;
  int sorting;
  DateTime createdAt;
  DateTime updatedAt;
  CategoriesTypes type;

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
    id: json["_id"],
    isAvailable: json["is_available"],
    name: json["name"],
    tag: json["tag"],
    appPercentage: json["app_percentage"],
    downPaymentPercentage: json["down_payment_percentage"],
    image: json["image"],
    sorting: json["sorting"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    type: getTypeValue(json["tag"]),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "is_available": isAvailable,
    "name": name,
    "tag": tag,
    "app_percentage": appPercentage,
    "down_payment_percentage": downPaymentPercentage,
    "image": image,
    "sorting": sorting,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "type": type,
  };


  static CategoriesTypes getTypeValue(String value){
    switch(value){
      case "قاعات_افراح":
        return CategoriesTypes.firstCat;
      case "اجنحة_عرسان":
        return CategoriesTypes.secondCat;
      case "استراحات":
        return CategoriesTypes.firstCat;
      case "شاليهات":
        return CategoriesTypes.firstCat;
      case "ضيافة":
        return CategoriesTypes.thirdCat;
    }
    return CategoriesTypes.thirdCat;
  }

}


