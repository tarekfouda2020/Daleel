class OptionDataModel {
  OptionDataModel({
    required this.id,
    required this.option,
    required this.value,
    required this.translation,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String option;
  String value;
  Translation translation;
  DateTime createdAt;
  DateTime updatedAt;

  factory OptionDataModel.fromMap(Map<String, dynamic> json) => OptionDataModel(
    id: json["_id"],
    option: json["option"],
    value: json["value"],
    translation: Translation.fromMap(json["translation"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "option": option,
    "value": value,
    "translation": translation.toMap(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Translation {
  Translation({
    required this.ar,
  });

  Ar ar;

  factory Translation.fromMap(Map<String, dynamic> json) => Translation(
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
