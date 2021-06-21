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
        return FloatingActionButton(
          onPressed: null,
          elevation: 0,
          child: Icon(Icons.add,size: 25,color: Colors.white,),
          backgroundColor: MyColors.primary,
        );
      },
      openBuilder: (_, action) {
        return AddActivity();
      },
    );
  }
}
