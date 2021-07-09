class AddpackagePersonModel{
  String? nameEn;
  String? nameAr;
  String? descEn;
  String? descAr;
  int? numberOfPersons;
  int? minimumCount;
  int? maximumCount;
  int? pricePerPerson;
  double? packagePrice;
  double? numberOfBookingsPerDay;

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