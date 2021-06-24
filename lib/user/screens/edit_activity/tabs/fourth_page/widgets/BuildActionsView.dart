part of 'FourthPageWidgetImports.dart';


class BuildActionsView extends StatelessWidget {
  final EditActivityData activityData;

  const BuildActionsView({required this.activityData});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DefaultButton(
            title: "السابق",
            width: MediaQuery.of(context).size.width*.4,
            color: MyColors.secondary,
            onTap: ()=> activityData.goToPreviousPage(),
          ),
          DefaultButton(
            title: "حفظ",
            width: MediaQuery.of(context).size.width*.4,
            color: MyColors.secondary,
            onTap: ()=> AutoRouter.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
