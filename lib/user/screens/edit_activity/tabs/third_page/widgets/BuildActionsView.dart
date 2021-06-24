part of 'ThirdPageWidgetsImports.dart';

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
            title: "التالي",
            width: MediaQuery.of(context).size.width*.4,
            color: MyColors.secondary,
            onTap: ()=> activityData.goToNextPage(),
          ),
        ],
      ),
    );
  }
}
