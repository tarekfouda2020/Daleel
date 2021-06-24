part of 'PackagesImports.dart';


class Packages extends StatefulWidget {
  final EditActivityData activityData;

  const Packages({required this.activityData});
  @override
  _PackagesState createState() => _PackagesState();
}

class _PackagesState extends State<Packages>{

   PackagesData packagesData = new PackagesData();

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

