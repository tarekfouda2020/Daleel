part of 'ActivitiesWidgetImports.dart';

class BuildEditAction extends StatelessWidget {
  final PropertyModel model;
  final ActivitiesData activitiesData;

  const BuildEditAction({required this.model, required this.activitiesData});

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool?>(
      closedColor: Colors.transparent,
      closedElevation: 0,
      openElevation: 0,
      middleColor: Colors.transparent,
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: Duration(milliseconds: 600),
      onClosed: (bool? ref){
        if (ref!=null) {
          activitiesData.pagingController.refresh();
        }
      },
      closedBuilder: (BuildContext context, void Function() action) {
        return BuildActivityAction(
          title: tr(context, "edit"),
          onTap: null,
          iconData: Icons.edit,
        );
      },
      openBuilder: (_, action) {
        return EditActivity(model: model);
      },
      useRootNavigator: true,
    );
  }
}

