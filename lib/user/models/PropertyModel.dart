import 'package:base_flutter/user/models/CategoryModel.dart';
import 'CityModel.dart';
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
  });

  String id;
  int price;
  CategoryModel category;
  CityModel city;
  int rate;
  String name;
  List<String> images;
  List<dynamic> packagePrices;
  List<dynamic> personPrices;
  String description;
  List<dynamic> panoramicImages;
  String user;
  List<CityModel> occasions;
  SubCategoryModel subCategory;
  List<SubCategoryModel> options;
  String termsAndConditions;
  int capacity;
  List<dynamic> bookingDays;
  bool isOffer;
  bool isOfferAvailable;

  factory PropertyModel.fromMap(Map<String, dynamic> json) => PropertyModel(
    id: json["_id"],
    price: json["price"],
    category: CategoryModel.fromMap(json["category"]),
    city: CityModel.fromMap(json["city"]),
    rate: json["rate"],
    name: json["name"],
    images: List<String>.from(json["images"].map((x) => x)),
    packagePrices: List<dynamic>.from(json["packagePrices"].map((x) => x)),
    personPrices: List<dynamic>.from(json["personPrices"].map((x) => x)),
    description: json["description"],
    panoramicImages: List<dynamic>.from(json["panoramic_images"].map((x) => x)),
    user: json["user"],
    occasions: List<CityModel>.from(json["occasions"].map((x) => CityModel.fromMap(x))),
    subCategory: SubCategoryModel.fromMap(json["sub_category"]),
    options: List<SubCategoryModel>.from(json["options"].map((x) => SubCategoryModel.fromMap(x))),
    termsAndConditions: json["terms_and_conditions"],
    capacity: json["capacity"],
    bookingDays: List<dynamic>.from(json["booking_days"].map((x) => x)),
    isOffer: json["is_offer"],
    isOfferAvailable: json["is_offer_available"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "price": price,
    "category": category.toMap(),
    "city": city.toMap(),
    "rate": rate,
    "name": name,
    "images": List<dynamic>.from(images.map((x) => x)),
    "packagePrices": List<dynamic>.from(packagePrices.map((x) => x)),
    "personPrices": List<dynamic>.from(personPrices.map((x) => x)),
    "description": description,
    "panoramic_images": List<dynamic>.from(panoramicImages.map((x) => x)),
    "user": user,
    "occasions": List<dynamic>.from(occasions.map((x) => x.toMap())),
    "sub_category": subCategory.toMap(),
    "options": List<dynamic>.from(options.map((x) => x.toMap())),
    "terms_and_conditions": termsAndConditions,
    "capacity": capacity,
    "booking_days": List<dynamic>.from(bookingDays.map((x) => x)),
    "is_offer": isOffer,
    "is_offer_available": isOfferAvailable,
  };
}