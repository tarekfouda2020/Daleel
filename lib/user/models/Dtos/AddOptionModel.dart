import 'package:flutter/material.dart';

class AddOptionModel{
  AddOptionModel({
    required this.id,
    required this.name,
    required this.descAr,
    required this.descEn,
    this.lang = "ar",
    this.translation,
  });

  String id;
  String name;
  TextEditingController descAr;
  TextEditingController descEn;
  String lang;
  TransitionModel? translation;


  factory AddOptionModel.fromMap(Map<String, dynamic> json) => AddOptionModel(
    id: json["_id"],
    name: json["name"],
    translation: json["translation"]==null?TransitionModel(ar: Ar(name: json["name"]))
        : TransitionModel.fromMap(json["translation"]),
    descAr: TextEditingController(),
    descEn: TextEditingController(),
  );

  Map<String, dynamic> toMap() => {
    "option": id,
    "value": descEn.text,
    "translation": TransitionModel(ar: Ar(name: descAr.text)).toMap()
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