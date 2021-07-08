part of 'FirstCatScreenImports.dart';

class FirstCatScreen extends StatefulWidget {
  final AddActivityData addActivityData;

  const FirstCatScreen({required this.addActivityData});

  @override
  _FirstCatScreenState createState() => _FirstCatScreenState();
}

class _FirstCatScreenState extends State<FirstCatScreen>{

  final FirstCatScreenData screenData = new FirstCatScreenData();

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
                BuildActivityCard(),
                BuildFirstDeptCard(title: "القسم الاول"),
                BuildFirstDeptCard(title: "القسم الثاني"),

              ],
            ),
          ),
          BuildActionsView(addActivityData: widget.addActivityData)
        ],
      ),
    );
  }

}

