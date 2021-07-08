part of 'PackagesWidgetImports.dart';

class BuildTypeAction extends StatelessWidget {
  final String title;
  final bool selected;
  final Function() onTap;

  const BuildTypeAction({required this.selected, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
      decoration: BoxDecoration(
        color: selected? MyColors.fillColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          Icon(Icons.add,size: 25,color: MyColors.blackOpacity,),
          SizedBox(width: 10),
          MyText(title: "$title", color: Colors.black54, size: 10)
        ],
      ),
    );
  }

}

