part of 'FirstPageWidgetImports.dart';

class BuildActionView extends StatelessWidget {
  final FirstPageData pageData;
  final AddActivityData addActivityData;

  const BuildActionView({required this.pageData, required this.addActivityData});
  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      title: "التالي",
      margin: EdgeInsets.only(right: 20,left: 20,bottom: 30),
      onTap: ()=> addActivityData.goToNextPage(),
      color: MyColors.secondary,
    );
  }
}