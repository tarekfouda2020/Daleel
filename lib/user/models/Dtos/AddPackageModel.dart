class AddPackageModel{

  String? nameEn;
  String? nameAr;
  String? descEn;
  String? descAr;
  int? numberOfPersons;
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
  };

}