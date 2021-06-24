part of 'ThirdPageImports.dart';

class ThirdPage extends StatefulWidget {
  final EditActivityData activityData;

  const ThirdPage({required this.activityData});
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>{

  final ThirdPageData pageData = new ThirdPageData();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: MyColors.greyWhite)
        ),
        child: Column(
          children: [
            Flexible(
              child: ListView(
                children: [
                  BuildHeaderColor(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MyText(title: "المعلومات الاضافية", color: MyColors.primary, size: 16,fontWeight: FontWeight.w500,),
                  ),
                  BuildFormView(pageData: pageData)

                ],
              ),
            ),
            BuildActionsView(activityData: widget.activityData)
          ],
        ),
      ),
    );
  }

}

