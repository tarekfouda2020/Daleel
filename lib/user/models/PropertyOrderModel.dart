
import 'package:base_flutter/user/models/CategoryModel.dart';
import 'package:base_flutter/user/models/CityModel.dart';

import 'OrderLocationModel.dart';
import 'OrderPackageModel.dart';
import 'OrderPersonPriceModel.dart';
import 'PropertyOwner.dart';

class PropertyOrderModel {
  PropertyOrderModel({
    required this.id,
    required this.name,
    required this.images,
    required this.price,
    required this.owner,
    required this.isOffer,
    required this.location,
    required this.category,
    required this.packagePrices,
    required this.personPrices,
    required this.city,
    required this.ownerMobile,
    required this.offerPrice,
  });

  String id;
  String name;
  List<String> images;
  num price;
  num offerPrice;
  PropertyOwner owner;
  bool isOffer;
  OrderLocationModel location;
  CategoryModel category;
  List<OrderPackageModel> packagePrices;
  List<OrderPersonPriceModel> personPrices;
  CityModel city;
  String ownerMobile;

  factory PropertyOrderModel.fromMap(Map<String, dynamic> json) => PropertyOrderModel(
    id: json["_id"],
    name: json["name"],
    images: List<String>.from(json["images"].map((x) => x)),
    price: json["price"],
    offerPrice: json["offer_price"]??0,
    owner: PropertyOwner.fromMap(json["owner"]),
    isOffer: json["is_offer"],
    location: OrderLocationModel.fromMap(json["location"]),
    category: CategoryModel.fromMap(json["category"]),
    packagePrices: json["packagePrices"]!=null?
    List<OrderPackageModel>.from(json["packagePrices"].map((x) => OrderPackageModel.fromMap(x))):[],
    personPrices: json["personPrices"]!=null?
    List<OrderPersonPriceModel>.from(json["personPrices"].map((x) => OrderPersonPriceModel.fromMap(x))):[],
    city: CityModel.fromMap(json["city"]),
    ownerMobile: json["ownerMobile"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
    "images": List<dynamic>.from(images.map((x) => x)),
    "price": price,
    "owner": owner.toMap(),
    "is_offer": isOffer,
    "location": location.toMap(),
    "category": category.toMap(),
    "packagePrices": List<dynamic>.from(packagePrices.map((x) => x.toMap())),
    "personPrices": List<dynamic>.from(personPrices.map((x) => x.toMap())),
    "city": city.toMap(),
    "ownerMobile": ownerMobile,
  };
}
