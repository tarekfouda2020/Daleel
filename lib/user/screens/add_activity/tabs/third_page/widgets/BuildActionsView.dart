part of 'ThirdPageWidgetsImports.dart';

class BuildActionsView extends StatelessWidget {
  final AddActivityData addActivityData;

  const BuildActionsView({required this.addActivityData});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DefaultButton(
            title: tr(context, "previous"),
            width: MediaQuery.of(context).size.width*.4,
            color: MyColors.secondary,
            onTap: ()=> addActivityData.goToPreviousPage(),
          ),
          DefaultButton(
            title: tr(context, "next"),
            width: MediaQuery.of(context).size.width*.4,
            color: MyColors.secondary,
            onTap: ()=> addActivityData.thirdPageData.setAddDataToModel(addActivityData),
          ),
        ],
      ),
    );
  }
}
