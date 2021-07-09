import 'package:base_flutter/user/models/Dtos/AddPackageModel.dart';
import 'package:base_flutter/user/models/Dtos/AddPackagePersonModel.dart';

enum PackageType{
  package,
  person
}

class PackagesTypeModel {

  PackageType type;
  List<AddPackageModel> packages;
  List<AddpackagePersonModel> persons;

  PackagesTypeModel({this.type = PackageType.person, required this.packages, required this.persons});
}