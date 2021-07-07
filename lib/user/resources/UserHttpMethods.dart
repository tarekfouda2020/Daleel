import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
import 'package:base_flutter/user/models/Dtos/FilterModel.dart';
import 'package:base_flutter/user/models/OrderModel.dart';
import 'package:base_flutter/user/models/PropertyModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserHttpMethods {
  final BuildContext context;

  UserHttpMethods(this.context);

  Future<List<PropertyModel>> getAllProperties(int page, bool refresh) async {
    var user = context.read<UserCubit>().state.model;
    var params = "?page=$page&limit=10&name=&pagination=true";
    var data = await DioHelper(context: context, forceRefresh: refresh).get(
      url: "propertyOwner/${user.id}/properties$params",
    );
    if (data!=null) {
      return List<PropertyModel>.from(data["properties"].map((e) => PropertyModel.fromMap(e)));
    }else{
      return [];
    }
  }

  Future<List<OrderModel>> getOrders(int page, FilterModel? filter, bool refresh) async {
    var user = context.read<UserCubit>().state.model;
    String filterParam = "";
    if (filter!=null) {
       filterParam =filter.key=="to"? "&${filter.key}=${filter.value.text}&${filter.key2}=${filter.value2?.text}"
          :"&${filter.key}=${filter.value.text}";
    }
    var params = "?page=$page&limit=10&name=&pagination=true$filterParam";
    var data = await DioHelper(context: context, forceRefresh: refresh).get(
      url: "owners/${user.id}/bookings$params",
    );
    if (data!=null) {
      return List<OrderModel>.from(data["bookings"].map((e) => OrderModel.fromMap(e)));
    }else{
      return [];
    }
  }




}
