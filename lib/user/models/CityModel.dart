class CityModel {
  CityModel({
    required this.id,
    required this.name,
    this.lang = "ar",
    this.translation,
  });

  String id;
  String name;
  String lang;
  TransitionModel? translation;


  factory CityModel.fromMap(Map<String, dynamic> json) => CityModel(
    id: json["_id"],
    name: json["name"],
    translation: json["translation"]==null?TransitionModel(ar: Ar(name: json["name"]))
        : TransitionModel.fromMap(json["translation"]),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
    "translation": translation?.toMap()
  };

  @override
  String toString() {
    return lang=="ar"? translation?.ar.name??"" : name;
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
