// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  UserModel({
     this.id,
     this.mobile,
     this.name,
     this.roles = const[],
     this.token,
     this.createdAt,
     this.email,
     this.accountNumber,
     this.isVerified,
     this.city,
     this.lang,
  });

  String? id;
  String? mobile;
  String? name;
  List<String> roles;
  String? token;
  DateTime? createdAt;
  String? email;
  String? accountNumber;
  bool? isVerified;
  String? city;
  String? lang;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    id: json["_id"],
    mobile: json["mobile"],
    name: json["name"],
    roles: List<String>.from(json["roles"].map((x) => x)),
    token: json["token"],
    createdAt: DateTime.parse(json["created_at"]??"${DateTime.now().toIso8601String()}"),
    email: json["email"],
    accountNumber: json["account_number"],
    isVerified: json["is_verified"],
    city: json["city"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "mobile": mobile,
    "name": name,
    "roles": List<dynamic>.from(roles.map((x) => x)),
    "token": token,
    "email": email,
    "created_at":createdAt!.toIso8601String(),
    "account_number": accountNumber,
    "is_verified": isVerified,
    "city": city,
  };
}
