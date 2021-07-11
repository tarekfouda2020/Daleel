
import 'package:base_flutter/user/models/Dtos/PackagesTypeModel.dart';

enum OfferType{
  price,
  percentage
}

class AddOfferModel{
  String? from;
  String? to;
  double? percentage;
  double? price;
  String? property;
  OfferType? type;
  PackageType? packageType;


  Map<String, dynamic> toJson(){
    if (packageType==null) {
      return {
        "from":from,
        "to":to,
        "price":price??0,
        "percentage":percentage??0,
        "type":type==OfferType.price?"price":"percentage",
        "property":property,
      };
    }
    return {
      "from":from,
      "to":to,
      "price":price??0,
      "percentage":percentage??0,
      "type":type==OfferType.price?"price":"percentage",
      "property":property,
      "packageType":packageType==PackageType.person?"person":"package",
    };
  }

}