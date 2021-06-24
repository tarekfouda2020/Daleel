part of 'FourthPageWidgetImports.dart';

class BuildFeaturesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(title: "اضف المميزات", color: MyColors.secondary, size: 10,fontWeight: FontWeight.w600,),
          Container(
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: MyColors.fillColor,
              borderRadius: BorderRadius.circular(10)
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                Icon(Icons.add,size: 35,color: MyColors.secondary,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

