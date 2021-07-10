class AddpackagePersonModel{
  String? nameEn;
  String? nameAr;
  String? descEn;
  String? descAr;
  int? numberOfPersons;
  int? minimumCount;
  int? maximumCount;
  num? pricePerPerson;
  num? packagePrice;
  int? numberOfBookingsPerDay;

  AddpackagePersonModel({
    this.nameEn,
    this.nameAr,
    this.descEn,
    this.descAr,
    this.numberOfPersons,
    this.minimumCount,
    this.maximumCount,
    this.pricePerPerson,
    this.packagePrice,
    this.numberOfBookingsPerDay,
  });

  Map<String,dynamic> toJson()=>{
    "name":nameEn,
    "name_ar":nameAr,
    "description_ar":descAr,
    "description":descEn,
    "numberOfBookingsPerDay":numberOfBookingsPerDay,
    "packagePrice":packagePrice,
    "numberOfPersons":numberOfPersons,
    "pricePerPerson":pricePerPerson,
    "minimumCount":minimumCount,
    "maximumCount":maximumCount,
  };
}