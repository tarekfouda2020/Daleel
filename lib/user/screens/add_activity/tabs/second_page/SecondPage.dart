part of 'SecondPageImports.dart';

class SecondPage extends StatefulWidget {
  final AddActivityData addActivityData;

  const SecondPage({required this.addActivityData});
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>{
  
  final SecondPageData pageData =new SecondPageData();
  
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

