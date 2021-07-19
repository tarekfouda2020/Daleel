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
    required this.translation,
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
  TransitionModel translation;

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
    translation: json["translation"]==null?TransitionModel(ar: Ar(name: json["name"]))
        : TransitionModel.fromMap(json["translation"]),


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
      case "استراحات":
        return CategoriesTypes.firstCat;
      case "شاليهات":
        return CategoriesTypes.firstCat;
      case "اجنحة_عرسان":
        return CategoriesTypes.thirdCat;
      case "ضيافة":
        return CategoriesTypes.secondCat;
    }
    return CategoriesTypes.secondCat;
  }

}

class TransitionModel {
  TransitionModel({
    required this.ar,
  });

  Ar ar;

  factory TransitionModel.fromMap(Map<String, dynamic> json) => TransitionModel(
    ar: Ar.fromMap(json["ar"]),
  );

  Map<String, dynamic> toMap() => {
    "ar": ar.toMap(),
  };
}

class Ar {
  Ar({
    required this.name,
  });

  String name;

  factory Ar.fromMap(Map<String, dynamic> json) => Ar(
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
  };
}

