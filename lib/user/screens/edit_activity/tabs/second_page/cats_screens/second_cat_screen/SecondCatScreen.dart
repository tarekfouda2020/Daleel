part of 'SecondCatScreenImports.dart';

class SecondCatScreen extends StatefulWidget {
  final EditActivityData activityData;

  const SecondCatScreen({required this.activityData});
  @override
  _SecondCatScreenState createState() => _SecondCatScreenState();
}

class _SecondCatScreenState extends State<SecondCatScreen>{

  late SecondCatScreenData screenData ;


  @override
  void initState() {
    super.initState();
    screenData=widget.activityData.secondCatScreenData;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
      child: Column(
        children: [
          Flexible(
            child: ListView(
              children: [
                MyText(title: tr(context, "price"), color: MyColors.primary, size: 16,fontWeight: FontWeight.w600,),
                BuildPackagesCard(screenData: screenData)
              ],
            ),
          ),
          BuildActionsView(activityData: widget.activityData)
        ],
      ),
    );
  }

}

