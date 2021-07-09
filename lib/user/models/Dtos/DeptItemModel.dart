import 'package:flutter/material.dart';

class DeptItemModel {
  String name;
  TextEditingController value;

  DeptItemModel({required this.name, required this.value});
  Map<String, dynamic> toJson()=>{
    name:value.text
  };
}
