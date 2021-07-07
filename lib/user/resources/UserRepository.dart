
import 'package:base_flutter/user/models/OrderModel.dart';
import 'package:base_flutter/user/models/PropertyModel.dart';
import 'package:base_flutter/user/resources/UserHttpMethods.dart';
import 'package:flutter/material.dart';

class UserRepository{
  late BuildContext _context;
  late UserHttpMethods _httpMethods;
  UserRepository(BuildContext context) {
    _context = context;
    _httpMethods = new UserHttpMethods(_context);
  }

  Future<List<PropertyModel>> getAllProperties(int page, bool refresh)=>
      _httpMethods.getAllProperties(page, refresh);

  Future<List<OrderModel>> getOrders(int page, bool refresh)=>
      _httpMethods.getOrders(page, refresh);

}