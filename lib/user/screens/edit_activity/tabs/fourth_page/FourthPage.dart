part of 'FourthPageImports.dart';

class FourthPage extends StatefulWidget {
  final EditActivityData activityData;

  const FourthPage({required this.activityData});
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage>{

  final FourthPageData pageData = new FourthPageData();

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
                BuildFeaturesView(),
              ],
            ),
          ),
          Flexible(
            child: BuildMapView(pageData: pageData,),
          ),
          BuildActionsView(activityData: widget.activityData )
        ],
      ),
    );
  }
}

