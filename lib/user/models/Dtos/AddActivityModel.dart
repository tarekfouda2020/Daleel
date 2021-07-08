import 'dart:io';

import 'package:base_flutter/user/models/CategoryModel.dart';

class AddActivityModel{

  CategoryModel? categoryModel;
  List<File>? images;
  String? nameAr;
  String? nameEn;
  String? city;


  Map<String, dynamic> toJson()=>{
    "category":categoryModel?.id,
    "images":categoryModel?.image,
    "name":nameEn,
    "translation": {
      "ar": {
        "name": nameAr,
        "description": "غير قابل للحجز غير قابل للحجز غير قابل للحجز غير قابل للحجز غير قابل للحجز ",
        "terms_and_conditions": "غير قابل للحجز "
      }
    },
  };


}