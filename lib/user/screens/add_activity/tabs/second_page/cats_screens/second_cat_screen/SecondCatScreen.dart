part of 'SecondCatScreenImports.dart';

class SecondCatScreen extends StatefulWidget {
  final AddActivityData activityData;

  const SecondCatScreen({required this.activityData});
  @override
  _SecondCatScreenState createState() => _SecondCatScreenState();
}

class _SecondCatScreenState extends State<SecondCatScreen>{

  final SecondCatScreenData screenData = new SecondCatScreenData();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
      child: Column(
        children: [
          Flexible(
            child: ListView(
              children: [
                MyText(title: "السعر", color: MyColors.primary, size: 16,fontWeight: FontWeight.w600,),
                BuildPackagesCard()
              ],
            ),
          ),
          BuildActionsView(activityData: widget.activityData)
        ],
      ),
    );
  }

}

