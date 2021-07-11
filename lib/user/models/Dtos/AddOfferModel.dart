
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
  String? type;
  String? packageType;


  AddOfferModel(
      {this.from,
      this.to,
      this.percentage,
      this.price,
      this.property,
      this.type,
      this.packageType});

  Map<String, dynamic> toJson(){
    if (packageType==null) {
      return {
        "from":from,
        "to":to,
        "price":price??0,
        "percentage":percentage??0,
        "type":type,
        "property":property,
      };
    }
    return {
      "from":from,
      "to":to,
      "price":price??0,
      "percentage":percentage??0,
      "type":type,
      "property":property,
      "packageType":packageType,
    };
  }

}