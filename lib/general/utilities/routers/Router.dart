part of 'RouterImports.dart';


@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    //general routes
    AdaptiveRoute(page: Splash, initial: true,),
    CustomRoute(page: Login,transitionsBuilder: TransitionsBuilders.fadeIn,durationInMilliseconds: 1000),
    AdaptiveRoute(page: ForgetPassword),
    AdaptiveRoute(page: ActiveAccount),
    AdaptiveRoute(page: ResetPassword),
    AdaptiveRoute(page: SelectLang),
    AdaptiveRoute(page: Terms),
    AdaptiveRoute(page: About),
    AdaptiveRoute(page: ContactUs),
    AdaptiveRoute(page: ConfirmPassword),
    AdaptiveRoute(page: ChangePassword),
    AdaptiveRoute(page: ImageZoom),

    // user pages
    CustomRoute(page: Home,transitionsBuilder: TransitionsBuilders.fadeIn,durationInMilliseconds: 1000),
    AdaptiveRoute(page: EditActivity),



  ],
)
class $AppRouter {}