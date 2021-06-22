part of 'AddActivityWidgetsImports.dart';

class BuildStepperCircle extends StatelessWidget {
  final int step;
  final int current;
  final AddActivityData activityData;
  const BuildStepperCircle({required this.step,required this.current,required this.activityData});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: MyColors.greyWhite
      ),
      alignment: Alignment.center,
      child: Visibility(
        visible: current>=step,
        child: TweenAnimationBuilder(
          curve: Curves.easeIn,
          tween: Tween<double>(begin: 0,end: 1),
          duration: Duration(milliseconds: 1500),
          child: Icon(Icons.circle,size: 15,color: MyColors.primary,),
          builder: (context,value,child){
            return Opacity(opacity: double.parse(value.toString()),child: child,);
          },
        ),
      ),
    );
  }
}

