import 'package:base_flutter/user/models/Dtos/DeptItemModel.dart';
import 'package:flutter/cupertino.dart';

class AddDeptModel{

 bool saved;
 AddDeptModel(this.saved);

 List<DeptItemModel> allDeptFields = [
  DeptItemModel(name: "saturdayPrice", value: TextEditingController()),
  DeptItemModel(name: "sundayPrice", value: TextEditingController()),
  DeptItemModel(name: "mondayPrice", value: TextEditingController()),
  DeptItemModel(name: "tuesdayPrice", value: TextEditingController()),
  DeptItemModel(name: "wednesPrice", value: TextEditingController()),
  DeptItemModel(name: "thursdayPrice", value: TextEditingController()),
  DeptItemModel(name: "fridayPrice", value: TextEditingController()),
  DeptItemModel(name: "name", value: TextEditingController()),
  DeptItemModel(name: "capacity", value: TextEditingController()),
  DeptItemModel(name: "description", value: TextEditingController()),
  DeptItemModel(name: "description_ar", value: TextEditingController()),
 ];



}
