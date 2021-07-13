part of 'ThirdPageImports.dart';

class ThirdPage extends StatefulWidget {
  final AddActivityData addActivityData;

  const ThirdPage({required this.addActivityData});

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late ThirdPageData pageData;

  @override
  void initState() {
    super.initState();
    pageData = widget.addActivityData.thirdPageData;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: MyColors.greyWhite)),
        child: Column(
          children: [
            Flexible(
              child: ListView(
                children: [
                  BuildHeaderColor(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MyText(
                      title: tr(context, "additionalInfo"),
                      color: MyColors.primary,
                      size: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  BuildFormView(
                    pageData: pageData,
                    catId: widget.addActivityData.activityModel.categoryModel!.id,
                  )
                ],
              ),
            ),
            BuildActionsView(addActivityData: widget.addActivityData)
          ],
        ),
      ),
    );
  }
}
