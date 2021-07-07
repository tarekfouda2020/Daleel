import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/GlobalState.dart';
import 'package:base_flutter/general/models/QuestionModel.dart';
import 'package:base_flutter/general/models/UserModel.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralHttpMethods {
  final BuildContext context;


  FirebaseMessaging messaging = FirebaseMessaging.instance;

  GeneralHttpMethods(this.context);

  Future<bool> userLogin(String phone, String pass) async {
    String _lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "mobile": "+966$phone",
      "type": "property_owner",
    };
    var _data = await DioHelper(context: context).post(url: "login",body: body,showLoader: false);

    if (_data != null) {
      AutoRouter.of(context).push(ActiveAccountRoute(userId: _data["id"]));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> verifyUser(String code, String id) async {
    String? _token = await messaging.getToken();
    String _lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "mobile_token": int.parse(code),
      "user": id,
    };
    var _data = await DioHelper(context: context).post(url: "verify",body: body,showLoader: false);

    if (_data != null) {
      UserModel user = UserModel.fromMap(_data);
      await Utils.setDeviceId(user.token!);
      GlobalState.instance.set("token", user.token);
      await Utils.saveUserData(user);
      Utils.setCurrentUserData(user, context);
      return true;
    } else {
      return false;
    }
  }

  Future<void> getHomeConstData()async{
    var _data= await DioHelper(context: context,forceRefresh: false).get(url: "/api/v1/ListAllCat");
    if(_data!=null){
      return _data;
    }
    return null;
  }

  Future<bool> sendCode(String code, String userId) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {"lang": lang, "code": code, "userId": userId};
    var _data = await DioHelper(context: context)
        .post(url: "/api/v1/ConfirmCodeRegister", body: body, showLoader: false);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> resendCode(String userId) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {"lang": lang, "userId": userId};
    var _data = await DioHelper(context: context).post(url: "/api/v1/ResendCode", body:body);
    return (_data != null);
  }

  Future<String?> aboutApp() async {
    Map<String, dynamic> body = {
      "lang": context.read<LangCubit>().state.locale.languageCode,
    };
    var _data =
    await DioHelper(context: context).get(url: "/api/v1/AboutApp");
    if (_data != null) {
      return _data["data"]["about_app"];
    } else {
      return null;
    }
  }

  Future<String?> terms() async {
    Map<String, dynamic> body = {
      "lang": context.read<LangCubit>().state.locale.languageCode,
    };
    var _data =
    await DioHelper(context: context).get(url: "/api/v1/AboutApp");
    if (_data != null) {
      return _data["data"]["condetions"];
    } else {
      return null;
    }
  }

  Future<List<QuestionModel>> frequentQuestions() async {
    Map<String, dynamic> body = {
      "lang": context.read<LangCubit>().state.locale.languageCode,
    };
    var _data = await DioHelper(context: context).get(url: "/api/v1/FrequentlyAskedQuestions");
    if (_data != null) {
      return List<QuestionModel>.from(
          _data["data"].map((e) => QuestionModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> switchNotify() async {
    Map<String, dynamic> body = {
      "lang": context.read<LangCubit>().state.locale.languageCode,
    };
    var _data = await DioHelper(context: context).post(url : "Client/SwitchNotify", body:body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> forgetPassword(String phone) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "phone": "$phone",
      "lang": lang,
    };
    var _data = await DioHelper(context: context)
        .post(url : "/api/v1/ForgetPassword", body:body , showLoader: false);
    if (_data != null) {
      // ExtendedNavigator.of(context).push(Routes.resetPassword,
      //     arguments: ResetPasswordArguments(userId: _data["code"]["user_id"]));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> resetUserPassword(
      String userId, String code, String pass) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "userId": "$userId",
      "code": "$code",
      "newPassword": "$pass",
      "lang": lang,
    };
    var _data = await DioHelper(context: context).get(url: "/api/v1/ChangePasswordByCode");
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> sendMessage(String? name, String? mail, String? message) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": "$lang",
      "name": "$name",
      "email": "$mail",
      "comment": "$message",
    };
    var _data =
    await DioHelper(context: context).post(url : "/api/v1/ContactUs", body:body, showLoader: false);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<UserModel?> checkActive(String phone) async {
    Map<String, dynamic> body = {
      "phone": "$phone",
    };
    var _data = await DioHelper(context: context).get(url: "/api/v1/CheckActive");
    print("data is $_data");
    if (_data != null) {
      final userCubit = context.read<UserCubit>().state.model;
      UserModel user = UserModel.fromMap(_data["data"]);
      int type = _data["userData"]["type"];
      user.token = userCubit.token;
      user.lang = userCubit.lang;
      return user;
    } else {
      return null;
    }
  }
}
