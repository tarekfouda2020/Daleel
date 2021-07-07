
import 'VerifyMobileModel.dart';

class OrderUserModel {
  OrderUserModel({
    required this.id,
    required this.roles,
    required this.isVerified,
    required this.name,
    required this.mobile,
    required this.accountNumber,
    required this.email,
    required this.city,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
    required this.v,
    required this.verifyMobile,
  });

  String id;
  List<String> roles;
  bool isVerified;
  String name;
  String mobile;
  String accountNumber;
  String email;
  String city;
  DateTime createdAt;
  DateTime updatedAt;
  String token;
  int v;
  VerifyMobileModel verifyMobile;

  factory OrderUserModel.fromMap(Map<String, dynamic> json) => OrderUserModel(
    id: json["_id"],
    roles: List<String>.from(json["roles"].map((x) => x)),
    isVerified: json["is_verified"],
    name: json["name"],
    mobile: json["mobile"],
    accountNumber: json["account_number"],
    email: json["email"],
    city: json["city"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    token: json["token"],
    v: json["__v"],
    verifyMobile: VerifyMobileModel.fromMap(json["verify_mobile"]),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "roles": List<dynamic>.from(roles.map((x) => x)),
    "is_verified": isVerified,
    "name": name,
    "mobile": mobile,
    "account_number": accountNumber,
    "email": email,
    "city": city,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "token": token,
    "__v": v,
    "verify_mobile": verifyMobile.toMap(),
  };
}