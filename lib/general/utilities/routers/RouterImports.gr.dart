// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:base_flutter/general/screens/about/AboutImports.dart' as _i10;
import 'package:base_flutter/general/screens/active_account/ActiveAccountImports.dart'
    as _i6;
import 'package:base_flutter/general/screens/change_password/ChangePasswordImports.dart'
    as _i13;
import 'package:base_flutter/general/screens/confirm_password/ConfirmPasswordImports.dart'
    as _i12;
import 'package:base_flutter/general/screens/contact_us/ContactUsImports.dart'
    as _i11;
import 'package:base_flutter/general/screens/forget_password/ForgetPasswordImports.dart'
    as _i5;
import 'package:base_flutter/general/screens/image_zoom/ImageZoom.dart' as _i14;
import 'package:base_flutter/general/screens/login/LoginImports.dart' as _i4;
import 'package:base_flutter/general/screens/reset_password/ResetPasswordImports.dart'
    as _i7;
import 'package:base_flutter/general/screens/select_lang/SelectLangImports.dart'
    as _i8;
import 'package:base_flutter/general/screens/splash/SplashImports.dart' as _i3;
import 'package:base_flutter/general/screens/terms/TermsImports.dart' as _i9;
import 'package:base_flutter/user/models/Dtos/PackagesTypeModel.dart' as _i22;
import 'package:base_flutter/user/models/PropertyModel.dart' as _i21;
import 'package:base_flutter/user/screens/add_package/AddPackageImports.dart'
    as _i17;
import 'package:base_flutter/user/screens/edit_activity/EditActivityImports.dart'
    as _i16;
import 'package:base_flutter/user/screens/edit_package/EditPackageImports.dart'
    as _i19;
import 'package:base_flutter/user/screens/home/HomeImports.dart' as _i15;
import 'package:base_flutter/user/screens/offers/OffersImports.dart' as _i18;
import 'package:flutter/cupertino.dart' as _i20;
import 'package:flutter/material.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SplashRouteArgs>();
          return _i3.Splash(navigatorKey: args.navigatorKey);
        }),
    LoginRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.Login();
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false),
    ForgetPasswordRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.ForgetPassword();
        }),
    ActiveAccountRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ActiveAccountRouteArgs>();
          return _i6.ActiveAccount(userId: args.userId);
        }),
    ResetPasswordRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ResetPasswordRouteArgs>();
          return _i7.ResetPassword(userId: args.userId);
        }),
    SelectLangRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.SelectLang();
        }),
    TermsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i9.Terms();
        }),
    AboutRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i10.About();
        }),
    ContactUsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.ContactUs();
        }),
    ConfirmPasswordRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i12.ConfirmPassword();
        }),
    ChangePasswordRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i13.ChangePassword();
        }),
    ImageZoomRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ImageZoomRouteArgs>();
          return _i14.ImageZoom(images: args.images);
        }),
    HomeRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args =
              data.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
          return _i15.Home(tab: args.tab);
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false),
    EditActivityRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<EditActivityRouteArgs>();
          return _i16.EditActivity(model: args.model);
        }),
    AddPackageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<AddPackageRouteArgs>();
          return _i17.AddPackage(type: args.type);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 600,
        reverseDurationInMilliseconds: 600,
        opaque: true,
        barrierDismissible: false),
    OffersRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<OffersRouteArgs>();
          return _i18.Offers(model: args.model);
        },
        transitionsBuilder: _i1.TransitionsBuilders.zoomIn,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    EditPackageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<EditPackageRouteArgs>();
          return _i19.EditPackage(type: args.type, index: args.index);
        },
        transitionsBuilder: _i1.TransitionsBuilders.zoomIn,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false)
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashRoute.name, path: '/'),
        _i1.RouteConfig(LoginRoute.name, path: '/Login'),
        _i1.RouteConfig(ForgetPasswordRoute.name, path: '/forget-password'),
        _i1.RouteConfig(ActiveAccountRoute.name, path: '/active-account'),
        _i1.RouteConfig(ResetPasswordRoute.name, path: '/reset-password'),
        _i1.RouteConfig(SelectLangRoute.name, path: '/select-lang'),
        _i1.RouteConfig(TermsRoute.name, path: '/Terms'),
        _i1.RouteConfig(AboutRoute.name, path: '/About'),
        _i1.RouteConfig(ContactUsRoute.name, path: '/contact-us'),
        _i1.RouteConfig(ConfirmPasswordRoute.name, path: '/confirm-password'),
        _i1.RouteConfig(ChangePasswordRoute.name, path: '/change-password'),
        _i1.RouteConfig(ImageZoomRoute.name, path: '/image-zoom'),
        _i1.RouteConfig(HomeRoute.name, path: '/Home'),
        _i1.RouteConfig(EditActivityRoute.name, path: '/edit-activity'),
        _i1.RouteConfig(AddPackageRoute.name, path: '/add-package'),
        _i1.RouteConfig(OffersRoute.name, path: '/Offers'),
        _i1.RouteConfig(EditPackageRoute.name, path: '/edit-package')
      ];
}

class SplashRoute extends _i1.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({required _i20.GlobalKey<_i20.NavigatorState> navigatorKey})
      : super(name,
            path: '/', args: SplashRouteArgs(navigatorKey: navigatorKey));

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({required this.navigatorKey});

  final _i20.GlobalKey<_i20.NavigatorState> navigatorKey;
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/Login');

  static const String name = 'LoginRoute';
}

class ForgetPasswordRoute extends _i1.PageRouteInfo {
  const ForgetPasswordRoute() : super(name, path: '/forget-password');

  static const String name = 'ForgetPasswordRoute';
}

class ActiveAccountRoute extends _i1.PageRouteInfo<ActiveAccountRouteArgs> {
  ActiveAccountRoute({required String userId})
      : super(name,
            path: '/active-account',
            args: ActiveAccountRouteArgs(userId: userId));

  static const String name = 'ActiveAccountRoute';
}

class ActiveAccountRouteArgs {
  const ActiveAccountRouteArgs({required this.userId});

  final String userId;
}

class ResetPasswordRoute extends _i1.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({required String userId})
      : super(name,
            path: '/reset-password',
            args: ResetPasswordRouteArgs(userId: userId));

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({required this.userId});

  final String userId;
}

class SelectLangRoute extends _i1.PageRouteInfo {
  const SelectLangRoute() : super(name, path: '/select-lang');

  static const String name = 'SelectLangRoute';
}

class TermsRoute extends _i1.PageRouteInfo {
  const TermsRoute() : super(name, path: '/Terms');

  static const String name = 'TermsRoute';
}

class AboutRoute extends _i1.PageRouteInfo {
  const AboutRoute() : super(name, path: '/About');

  static const String name = 'AboutRoute';
}

class ContactUsRoute extends _i1.PageRouteInfo {
  const ContactUsRoute() : super(name, path: '/contact-us');

  static const String name = 'ContactUsRoute';
}

class ConfirmPasswordRoute extends _i1.PageRouteInfo {
  const ConfirmPasswordRoute() : super(name, path: '/confirm-password');

  static const String name = 'ConfirmPasswordRoute';
}

class ChangePasswordRoute extends _i1.PageRouteInfo {
  const ChangePasswordRoute() : super(name, path: '/change-password');

  static const String name = 'ChangePasswordRoute';
}

class ImageZoomRoute extends _i1.PageRouteInfo<ImageZoomRouteArgs> {
  ImageZoomRoute({required List<dynamic> images})
      : super(name,
            path: '/image-zoom', args: ImageZoomRouteArgs(images: images));

  static const String name = 'ImageZoomRoute';
}

class ImageZoomRouteArgs {
  const ImageZoomRouteArgs({required this.images});

  final List<dynamic> images;
}

class HomeRoute extends _i1.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({int tab = 0})
      : super(name, path: '/Home', args: HomeRouteArgs(tab: tab));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.tab = 0});

  final int tab;
}

class EditActivityRoute extends _i1.PageRouteInfo<EditActivityRouteArgs> {
  EditActivityRoute({required _i21.PropertyModel model})
      : super(name,
            path: '/edit-activity', args: EditActivityRouteArgs(model: model));

  static const String name = 'EditActivityRoute';
}

class EditActivityRouteArgs {
  const EditActivityRouteArgs({required this.model});

  final _i21.PropertyModel model;
}

class AddPackageRoute extends _i1.PageRouteInfo<AddPackageRouteArgs> {
  AddPackageRoute({required _i22.PackageType type})
      : super(name,
            path: '/add-package', args: AddPackageRouteArgs(type: type));

  static const String name = 'AddPackageRoute';
}

class AddPackageRouteArgs {
  const AddPackageRouteArgs({required this.type});

  final _i22.PackageType type;
}

class OffersRoute extends _i1.PageRouteInfo<OffersRouteArgs> {
  OffersRoute({required _i21.PropertyModel model})
      : super(name, path: '/Offers', args: OffersRouteArgs(model: model));

  static const String name = 'OffersRoute';
}

class OffersRouteArgs {
  const OffersRouteArgs({required this.model});

  final _i21.PropertyModel model;
}

class EditPackageRoute extends _i1.PageRouteInfo<EditPackageRouteArgs> {
  EditPackageRoute({required _i22.PackageType type, required int index})
      : super(name,
            path: '/edit-package',
            args: EditPackageRouteArgs(type: type, index: index));

  static const String name = 'EditPackageRoute';
}

class EditPackageRouteArgs {
  const EditPackageRouteArgs({required this.type, required this.index});

  final _i22.PackageType type;

  final int index;
}
