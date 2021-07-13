part of 'PackagesWidgetImports.dart';


class BuildActionsView extends StatelessWidget {
  final AddActivityData activityData;

  const BuildActionsView({required this.activityData});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DefaultButton(
            title: tr(context,"previous"),
            width: MediaQuery.of(context).size.width*.4,
            color: MyColors.secondary,
            onTap: ()=> activityData.goToPreviousPage(),
          ),
          DefaultButton(
            title: tr(context, "next"),
            width: MediaQuery.of(context).size.width*.4,
            color: MyColors.secondary,
            onTap: ()=> activityData.secondCatScreenData.savePackagesToModel(activityData,context),
          ),
        ],
      ),
    );
  }
}
