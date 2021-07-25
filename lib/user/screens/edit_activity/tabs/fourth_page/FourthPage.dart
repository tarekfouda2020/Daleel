part of 'FourthPageImports.dart';

class FourthPage extends StatefulWidget {
  final EditActivityData addActivityData;

  const FourthPage({required this.addActivityData});

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  late FourthPageData pageData;

  @override
  void initState() {
    pageData = widget.addActivityData.fourthPageData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: MyColors.greyWhite)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildHeaderColor(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MyText(
                      title: tr(context, "featuresAndLocation"),
                      color: MyColors.primary,
                      size: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(child: BuildFeaturesView(pageData: pageData)),
                ],
              ),
            ),
          ),
          BuildActionsView(addActivityData: widget.addActivityData)
        ],
      ),
    );
  }
}
