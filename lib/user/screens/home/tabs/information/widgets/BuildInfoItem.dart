part of 'InformationWidgetImports.dart';

class BuildInfoItem extends StatelessWidget {
  final String title;
  final String value;

  const BuildInfoItem({required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(title: title, color: MyColors.blackOpacity, size: 10,fontWeight: FontWeight.w600,),
          SizedBox(height: 5),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: MyColors.grey,width: .3)
            ),
            child: Row(
              children: [
                MyText(title: value, color: Colors.black54, size: 10,fontWeight: FontWeight.w600,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

