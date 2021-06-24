part of 'SplashImports.dart';

class Splash extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const Splash({required this.navigatorKey});
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash>  with TickerProviderStateMixin{

  final SplashData splashData =new SplashData();

  @override
  void initState() {
    GlobalNotification.instance.setupNotification(widget.navigatorKey);
    splashData.controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    splashData.checkController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    splashData.initAnimation(context);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        color: MyColors.white,
        child: Center(
          child: Container(
            width: 200,
            height: 180,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: splashData.controller,
                  builder: (BuildContext context, Widget? child) {
                    return Opacity(
                      opacity: splashData.logoFadeAnimation.value,
                      child: Image.asset(
                        Res.logoMark,
                        width: splashData.logoSizeAnimation.value,
                        height: splashData.logoSizeAnimation.value,
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: splashData.checkController,
                  builder: (BuildContext context, Widget? child) {
                    return Positioned(
                      bottom: 0,
                      right: splashData.transitionAnimation.value,
                      child: Opacity(
                        opacity: splashData.checkFadeAnimation.value,
                        child: Image.asset(
                          Res.logoCheck,
                          width: 140,
                          height: 140,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
