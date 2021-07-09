import 'dart:convert';
import 'dart:io';

import 'package:base_flutter/user/models/CategoryModel.dart';
import 'package:base_flutter/user/models/CityModel.dart';
import 'AddDeptModel.dart';

class AddActivityModel{

  CategoryModel? categoryModel;
  List<File>? images;
  String? nameAr;
  String? nameEn;
  String? city;
  Map<String,dynamic>? allSectionsPrice;
  Map<String,dynamic>?  firstSectionPrice;
  Map<String,dynamic>?  secondSectionPrice;
  String? termsAr;
  String? termsEn;
  List<double>? location;
  List<String>? subCategory;
  List<String>? occasions;
  List<CityModel>? options;


  Map<String, dynamic> toJson()=>{
    "data": json.encode(
        {
          "category":categoryModel?.id,
          "city":city,
          "name":nameEn,
          "price": 0,
          "capacity":allSectionsPrice?["capacity"],
          "allSectionsPrice":allSectionsPrice,
          "firstSectionPrice": firstSectionPrice,
          "secondSectionPrice":secondSectionPrice,
          "terms_and_conditions":termsEn,
          "description": allSectionsPrice?["description"],
          "location":location,
          "sub_category": subCategory,
          "occasions": occasions,
          "options": options?.map((e) => {"id":e.id,"value":e.name,"translation":{"ar":{"value":e.name}}}).toList(),
          "translation": {
            "ar": {
              "name": nameAr,
              "description": allSectionsPrice?["description_ar"],
              "terms_and_conditions": termsAr
            }
          },
        }
    ),
    "images":categoryModel?.image,

  };



}