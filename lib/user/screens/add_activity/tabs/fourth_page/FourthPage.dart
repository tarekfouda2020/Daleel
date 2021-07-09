part of 'FourthPageImports.dart';

class FourthPage extends StatefulWidget {
  final AddActivityData addActivityData;

  const FourthPage({required this.addActivityData});
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage>{

  late FourthPageData pageData;


  @override
  void initState() {
    pageData = widget.addActivityData.fourthPageData;
    pageData.getOptions(context, widget.addActivityData.activityModel.categoryModel!.id,refresh: false);
    pageData.getOptions(context, widget.addActivityData.activityModel.categoryModel!.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: MyColors.greyWhite)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildHeaderColor(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MyText(title: "المميزات او الموقع", color: MyColors.primary, size: 16,fontWeight: FontWeight.w500,),
                ),
                BuildFeaturesView(pageData: pageData),
              ],
            ),
          ),
          Flexible(
            child: BuildMapView(pageData: pageData,),
          ),
          BuildActionsView(addActivityData: widget.addActivityData)
        ],
      ),
    );
  }
}

