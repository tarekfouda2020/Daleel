part of 'FirstPageWidgetImports.dart';

class BuildActionView extends StatelessWidget {
  final FirstPageData pageData;
  final EditActivityData addActivityData;

  const BuildActionView({required this.pageData, required this.addActivityData});
  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      title: "التالي",
      margin: EdgeInsets.only(right: 20,left: 20,bottom: 30,top: 5),
      onTap: ()=> pageData.setActivityData(addActivityData,context),
      color: MyColors.secondary,
    );
  }
}
