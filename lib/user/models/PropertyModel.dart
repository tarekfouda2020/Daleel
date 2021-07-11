import 'package:base_flutter/user/models/CategoryModel.dart';
import 'CityModel.dart';
import 'DeptPriceModel.dart';
import 'PackagePriceModel.dart';
import 'PersonPriseModel.dart';
import 'SubCategoryModel.dart';

class PropertyModel {
  PropertyModel({
    required this.id,
    required this.price,
    required this.category,
    required this.city,
    required this.rate,
    required this.name,
    required this.images,
    required this.packagePrices,
    required this.personPrices,
    required this.description,
    required this.panoramicImages,
    required this.user,
    required this.occasions,
    required this.subCategory,
    required this.options,
    required this.termsAndConditions,
    required this.capacity,
    required this.bookingDays,
    required this.isOffer,
    required this.isOfferAvailable,
    this.allSectionsPrice,
    this.firstSectionPrice,
    this.secondSectionPrice,
    required this.translation,
    required this.propertyStatus,
    required this.location,
    required this.address
  });

  String id;
  num price;
  CategoryModel category;
  CityModel city;
  int rate;
  String name;
  List<String> images;
  List<PackagePriceModel> packagePrices;
  List<PersonPriceModel> personPrices;
  String description;
  List<String> panoramicImages;
  String user;
  List<CityModel> occasions;
  SubCategoryModel subCategory;
  List<CityModel> options;
  String termsAndConditions;
  String address;
  int capacity;
  List<dynamic> bookingDays;
  List<double> location;
  bool isOffer;
  bool isOfferAvailable;
  DeptPriceModel? allSectionsPrice;
  DeptPriceModel? firstSectionPrice;
  DeptPriceModel? secondSectionPrice;
  TransitionModel translation;
  PropertyStatus propertyStatus;

  factory PropertyModel.fromMap(Map<String, dynamic> json) => PropertyModel(
    id: json["_id"],
    price: json["price"],
    category: CategoryModel.fromMap(json["category"]),
    city: CityModel.fromMap(json["city"]),
    translation: TransitionModel.fromMap(json["translation"]),
    rate: json["rate"],
    name: json["name"],
      address: json["address"]??"",
    images: List<String>.from(json["images"].map((x) => x)),
    packagePrices: List<PackagePriceModel>.from(json["packagePrices"].map((x) => PackagePriceModel.fromMap(x))),
    personPrices: List<PersonPriceModel>.from(json["personPrices"].map((x) => PersonPriceModel.fromMap(x))),
    description: json["description"],
    panoramicImages: List<String>.from(json["panoramic_images"].map((x) => x)),
    location: json["location"]==null?[0.0,0.0]: List<double>.from(json["location"].map((x) => double.parse("$x"))),
    user: json["user"],
    occasions: List<CityModel>.from(json["occasions"].map((x) => CityModel.fromMap(x))),
    subCategory: SubCategoryModel.fromMap(json["sub_category"]),
    options: List<CityModel>.from(json["options"].map((x) => CityModel.fromMap(x))),
    termsAndConditions: json["terms_and_conditions"],
    capacity: json["capacity"],
    bookingDays: List<dynamic>.from(json["booking_days"].map((x) => x)),
    isOffer: json["is_offer"],
    propertyStatus: json["property_status"].toString().getStatusFromStr(),
    isOfferAvailable: json["is_offer_available"],
    allSectionsPrice: json["allSectionsPrice"]!=null? DeptPriceModel.fromMap(json["allSectionsPrice"]):null,
    firstSectionPrice: json["firstSectionPrice"]!=null?DeptPriceModel.fromMap(json["firstSectionPrice"]):null,
    secondSectionPrice: json["secondSectionPrice"]!=null?DeptPriceModel.fromMap(json["secondSectionPrice"]):null,
  );
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
    required this.description,
    required this.termsAndConditions,
  });

  String name;
  String description;
  String termsAndConditions;

  factory Ar.fromMap(Map<String, dynamic> json) => Ar(
    name: json["name"],
    description: json["description"],
    termsAndConditions: json["terms_and_conditions"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "description": description,
    "terms_and_conditions": termsAndConditions,
  };
}

enum PropertyStatus{
  pending,
  verified,
  rejected
}

extension PopState on String{
  PropertyStatus getStatusFromStr(){
    switch(this){
      case "pending":
        return PropertyStatus.pending;
      case "rejected":
        return PropertyStatus.rejected;
      default:
        return PropertyStatus.verified;
    }
  }
}