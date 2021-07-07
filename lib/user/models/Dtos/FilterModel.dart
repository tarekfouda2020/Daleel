import 'package:flutter/material.dart';

class FilterModel {
  String key;
  String? key2;
  String name;
  TextEditingController value;
  TextEditingController? value2;

  FilterModel({
    required this.key,
    required this.name,
    required this.value,
    this.value2,
    this.key2,
  });

  @override
  String toString() {
    return name;
  }
  
}
