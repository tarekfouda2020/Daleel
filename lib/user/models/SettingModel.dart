class SettingModel {
  SettingModel({
    required this.bank,
    required this.numberOfProperties,
    required this.numberOfBookings,
    required this.id,
    required this.supportNumber,
    required this.aboutUs,
    required this.rulesOfCustomers,
    required this.rulesOfPropertyOwners,
    required this.facebook,
    required this.twitter,
    required this.instagram,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.cancelRequestPolicy,
    required this.commercialRegisterNumber,
    required this.enterpriseName,
    required this.privacyPolicy,
    required this.replaceReturnPolicy,
    required this.supportEmail,
    required this.enterpriseAddress,
    required this.linkedin,
    required this.snapchat,
  });

  Bank bank;
  int numberOfProperties;
  int numberOfBookings;
  String id;
  String supportNumber;
  String aboutUs;
  String rulesOfCustomers;
  String rulesOfPropertyOwners;
  String facebook;
  String twitter;
  String instagram;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String cancelRequestPolicy;
  String commercialRegisterNumber;
  String enterpriseName;
  String privacyPolicy;
  String replaceReturnPolicy;
  String supportEmail;
  String enterpriseAddress;
  String linkedin;
  String snapchat;

  factory SettingModel.fromMap(Map<String, dynamic> json) => SettingModel(
    bank: Bank.fromMap(json["bank"]),
    numberOfProperties: json["number_of_properties"],
    numberOfBookings: json["number_of_bookings"],
    id: json["_id"],
    supportNumber: json["support_number"],
    aboutUs: json["about_us"],
    rulesOfCustomers: json["rules_of_customers"],
    rulesOfPropertyOwners: json["rules_of_property_owners"],
    facebook: json["facebook"],
    twitter: json["twitter"],
    instagram: json["instagram"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    v: json["__v"],
    cancelRequestPolicy: json["cancel_request_policy"],
    commercialRegisterNumber: json["commercial_register_number"],
    enterpriseName: json["enterprise_name"],
    privacyPolicy: json["privacy_policy"],
    replaceReturnPolicy: json["replace_return_policy"],
    supportEmail: json["support_email"],
    enterpriseAddress: json["enterprise_address"],
    linkedin: json["linkedin"],
    snapchat: json["snapchat"],
  );

  Map<String, dynamic> toMap() => {
    "bank": bank.toMap(),
    "number_of_properties": numberOfProperties,
    "number_of_bookings": numberOfBookings,
    "_id": id,
    "support_number": supportNumber,
    "about_us": aboutUs,
    "rules_of_customers": rulesOfCustomers,
    "rules_of_property_owners": rulesOfPropertyOwners,
    "facebook": facebook,
    "twitter": twitter,
    "instagram": instagram,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "__v": v,
    "cancel_request_policy": cancelRequestPolicy,
    "commercial_register_number": commercialRegisterNumber,
    "enterprise_name": enterpriseName,
    "privacy_policy": privacyPolicy,
    "replace_return_policy": replaceReturnPolicy,
    "support_email": supportEmail,
    "enterprise_address": enterpriseAddress,
    "linkedin": linkedin,
    "snapchat": snapchat,
  };
}

class Bank {
  Bank({
    required this.accountName,
    required this.accountNumber,
    required this.bankName,
  });

  String accountName;
  int accountNumber;
  String bankName;

  factory Bank.fromMap(Map<String, dynamic> json) => Bank(
    accountName: json["account_name"],
    accountNumber: json["account_number"],
    bankName: json["bank_name"],
  );

  Map<String, dynamic> toMap() => {
    "account_name": accountName,
    "account_number": accountNumber,
    "bank_name": bankName,
  };
}
