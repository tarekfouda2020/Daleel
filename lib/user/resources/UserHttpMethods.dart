import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
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
      return List<PropertyModel>.from(data[""].map((e) => PropertyModel.fromMap(e)));
    }else{
      return [];
    }
  }
}
