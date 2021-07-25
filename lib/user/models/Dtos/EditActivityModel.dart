import 'dart:convert';
import 'dart:io';

import 'package:base_flutter/user/models/CategoryModel.dart';
import 'package:base_flutter/user/models/Dtos/AddPackageModel.dart';
import 'AddOptionModel.dart';
import 'AddPackagePersonModel.dart';

class EditActivityModel{

  String? id;
  CategoryModel? categoryModel;
  List<File>? images;
  List<File>? panoramicImages;
  List<String>? exist;
  List<String>? existPanoramic;
  String? nameAr;
  String? nameEn;
  String? descEn;
  String? descAr;
  String? city;
  Map<String,dynamic>? allSectionsPrice;
  Map<String,dynamic>?  firstSectionPrice;
  Map<String,dynamic>?  secondSectionPrice;
  String? termsAr;
  String? termsEn;
  String? address;
  List<double>? location;
  List<String>? subCategory;
  List<String>? occasions;
  List<AddOptionModel>? options;
  double? price;
  int? opacity;
  List<AddPackageModel>? packagePrices;
  List<AddpackagePersonModel>? personPrices;


  Map<String, dynamic> toJson()=>{
    "data": json.encode(
        {
          "category":categoryModel?.id,
          "id":id,
          "location":location,
          "city":city,
          "name":nameEn,
          "address":address??"",
          "price": price??0,
          "capacity": opacity??allSectionsPrice?["capacity"]??0,
          "allSectionsPrice":allSectionsPrice??{},
          "firstSectionPrice": firstSectionPrice??{},
          "secondSectionPrice":secondSectionPrice??{},
          "terms_and_conditions":termsEn,
          "description": descEn,
          "images": exist,
          "panoramic_images": existPanoramic,
          "sub_category": subCategory,
          "occasions": occasions,
          "packagePrices": packagePrices??[],
          "personPrices": personPrices??[],
          "options": options?.map((e) => e.toMap()).toList(),
          "translation": {
            "ar": {
              "name": nameAr,
              "description": descAr,
              "terms_and_conditions": termsAr
            }
          },
        }
    ),
    "images":images,
    "panoramic_images":panoramicImages,

  };



}