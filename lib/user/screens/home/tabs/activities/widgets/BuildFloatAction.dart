part of 'ActivitiesWidgetImports.dart';

class BuildFloatAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      closedElevation: 0,
      openElevation: 0,
      middleColor: Colors.transparent,
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: Duration(milliseconds: 600),
      closedBuilder: (BuildContext context, void Function() action) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          decoration: BoxDecoration(
              color: MyColors.primary,
              borderRadius: BorderRadius.circular(20)
          ),
          alignment: Alignment.center,
          child: MyText(title: "اضف نشاطك",color: MyColors.white, size: 12,),
        );
      },
      openBuilder: (_, action) {
        return AddActivity();
      },
    );
  }
}
