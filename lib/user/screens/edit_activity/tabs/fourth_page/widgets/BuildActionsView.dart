part of 'FourthPageWidgetImports.dart';

class BuildActionsView extends StatelessWidget {
  final EditActivityData addActivityData;

  const BuildActionsView({required this.addActivityData});
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
            onTap: ()=> addActivityData.goToPreviousPage(),
          ),
          DefaultButton(
            title: "حفظ",
            width: MediaQuery.of(context).size.width*.4,
            color: MyColors.secondary,
            onTap: ()=> addActivityData.fourthPageData.saveDataToModel(context, addActivityData),
          ),
        ],
      ),
    );
  }
}
