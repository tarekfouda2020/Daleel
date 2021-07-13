import 'dart:convert';
import 'dart:io';

import 'package:base_flutter/user/models/CategoryModel.dart';
import 'package:base_flutter/user/models/CityModel.dart';
import 'package:base_flutter/user/models/Dtos/AddPackageModel.dart';
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
  List<CityModel>? options;
  double? price;
  int? opacity;
  List<AddPackageModel>? packagePrices;
  List<AddpackagePersonModel>? personPrices;


  Map<String, dynamic> toJson()=>{
    "data": json.encode(
        {
          "category":categoryModel?.id,
          "id":id,
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
          "location":location,
          "images": exist,
          "panoramic_images": exist,
          "sub_category": subCategory,
          "occasions": occasions,
          "packagePrices": packagePrices??[],
          "personPrices": personPrices??[],
          "options": options?.map((e) => {"option":e.id,"value":e.name,"translation":{"ar":{"value":e.name}}}).toList(),
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