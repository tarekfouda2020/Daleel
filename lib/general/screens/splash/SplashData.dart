part of 'SplashImports.dart';

class SplashData{

  late AnimationController controller;
  late AnimationController checkController;
  late  Animation<double> logoSizeAnimation;
  late  Animation<double> logoFadeAnimation;
  late  Animation<double> checkFadeAnimation;
  late  Animation<double> transitionAnimation;


  initAnimation(BuildContext context){
    logoSizeAnimation =  Tween<double>(begin: 0,end: 160).animate(controller);
    logoFadeAnimation =  Tween<double>(begin: 0,end: 1).animate(controller);
    checkFadeAnimation =  Tween<double>(begin: 0,end: 1).animate(checkController);
    transitionAnimation =  Tween<double>(begin: 50,end: 9).animate(checkFadeAnimation);

    controller.forward().whenComplete((){
      checkController.forward().whenComplete(() {
        Utils.manipulateSplashData(context);
      });
    });
  }


}