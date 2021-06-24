part of 'FirstPageWidgetImports.dart';

class BuildActionView extends StatelessWidget {
  final FirstPageData pageData;
  final EditActivityData activityData;

  const BuildActionView({required this.pageData, required this.activityData});
  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      title: "التالي",
      margin: EdgeInsets.only(right: 20,left: 20,bottom: 30,top: 10),
      onTap: ()=> activityData.goToNextPage(),
      color: MyColors.secondary,
    );
  }
}
