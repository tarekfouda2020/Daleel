import 'package:json_annotation/json_annotation.dart';

part 'UserModel.g.dart';

@JsonSerializable()
class UserModel {


  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "lang")
  String lang;
  @JsonKey(name: "type")
  String? type;


  UserModel({this.id,this.token,required this.lang,this.type});



  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}