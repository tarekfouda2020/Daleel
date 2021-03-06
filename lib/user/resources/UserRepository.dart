
import 'package:base_flutter/general/models/UserModel.dart';
import 'package:base_flutter/user/models/CityModel.dart';
import 'package:base_flutter/user/models/Dtos/AddActivityModel.dart';
import 'package:base_flutter/user/models/Dtos/AddOfferModel.dart';
import 'package:base_flutter/user/models/Dtos/AddOptionModel.dart';
import 'package:base_flutter/user/models/Dtos/EditActivityModel.dart';
import 'package:base_flutter/user/models/Dtos/FilterModel.dart';
import 'package:base_flutter/user/models/Dtos/UpdateUserModel.dart';
import 'package:base_flutter/user/models/OrderModel.dart';
import 'package:base_flutter/user/models/PropertyModel.dart';
import 'package:base_flutter/user/models/SettingModel.dart';
import 'package:base_flutter/user/models/SubCategoryModel.dart';
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

  Future<List<OrderModel>> getOrders(int page, FilterModel? filter, bool refresh)=>
      _httpMethods.getOrders(page, filter, refresh);

  Future<List<CityModel>> getCities(bool refresh)=>
      _httpMethods.getCities(refresh);

  Future<List<SubCategoryModel>> getSubCategories(String catId,bool refresh)=>
      _httpMethods.getSubCategories(catId, refresh);

  Future<List<CityModel>> getLocations(bool refresh)=>
      _httpMethods.getLocations(refresh);

  Future<List<AddOptionModel>> getOptions(String catId,bool refresh)=>
      _httpMethods.getOptions(catId, refresh);

  Future<bool> addOffer(AddOfferModel model)=>
      _httpMethods.addOffer(model);

  Future<bool> addActivity(AddActivityModel model)=>
      _httpMethods.addActivity(model);

  Future<bool> editActivity(EditActivityModel model)=>
      _httpMethods.editActivity(model);

  Future<SettingModel?> getSettings(bool refresh)=>
      _httpMethods.getSettings(refresh);

  Future<UserModel> getUserData(bool refresh)=>
      _httpMethods.getUserData(refresh);

  Future<UserModel> updateUserData(UpdateUserModel model)=>
      _httpMethods.updateUserData(model);
}