class AddPackageModel{

  String? nameEn;
  String? nameAr;
  String? descEn;
  String? descAr;
  int? numberOfPersons;
  double? packagePrice;
  int? numberOfBookingsPerDay;

  AddPackageModel({
    this.nameEn,
    this.nameAr,
    this.descEn,
    this.descAr,
    this.numberOfPersons,
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
  };

}