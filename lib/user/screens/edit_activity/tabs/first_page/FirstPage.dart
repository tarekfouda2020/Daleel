part of 'FirstPageImports.dart';

class FirstPage extends StatefulWidget {
  final EditActivityData activityData;

  const FirstPage({required this.activityData});
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  final FirstPageData pageData = new FirstPageData();

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
                padding: EdgeInsets.zero,
                children: [
                  BuildHeaderColor(),
                  // BuildTypesView(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MyText(title: "المعلومات الاساسية", color: MyColors.primary, size: 16,fontWeight: FontWeight.w500,),
                  ),
                  BuildImagesView(
                    onTap: (){},
                    title: "رفع الصور",
                  ),
                  BuildImagesView(
                    onTap: (){},
                    title: "رفع صور ٣٦٠ درجة",
                  ),
                  BuildFormView(pageData: pageData),
                ],
              ),
            ),
            BuildActionView(
              pageData: pageData,
              activityData: widget.activityData,
            ),
          ],
        ),
      ),
    );
  }
}
