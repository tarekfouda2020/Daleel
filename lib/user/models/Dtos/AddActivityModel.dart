import 'dart:io';

import 'package:base_flutter/user/models/CategoryModel.dart';
import 'AddDeptModel.dart';

class AddActivityModel{

  CategoryModel? categoryModel;
  List<File>? images;
  String? nameAr;
  String? nameEn;
  String? city;
  AddDeptModel? allSectionsPrice;
  AddDeptModel? firstSectionPrice;
  AddDeptModel? secondSectionPrice;
  String? termsAr;
  String? termsEn;


  Map<String, dynamic> toJson()=>{
    "category":categoryModel?.id,
    "images":categoryModel?.image,
    "name":nameEn,
    "allSectionsPrice":allSectionsPrice?.allDeptFields.map((e) => e.toJson()),
    "firstSectionPrice": firstSectionPrice!.saved? firstSectionPrice?.allDeptFields.map((e) => e.toJson()):null,
    "secondSectionPrice":secondSectionPrice!.saved? secondSectionPrice?.allDeptFields.map((e) => e.toJson()):null,
    "terms_and_conditions":termsEn,
    "description": allSectionsPrice?.allDeptFields[9].value.text,
    "translation": {
      "ar": {
        "name": nameAr,
        "description": allSectionsPrice?.allDeptFields[10].value.text,
        "terms_and_conditions": termsAr
      }
    },
  };


}