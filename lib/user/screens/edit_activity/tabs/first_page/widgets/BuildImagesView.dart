part of 'FirstPageWidgetImports.dart';

class BuildImagesView extends StatelessWidget {
  final String title;
  final Function() onTap;

  const BuildImagesView({required this.title, required this.onTap}) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(title: title, color: MyColors.black, size: 10,fontWeight: FontWeight.w600,),
          SizedBox(height: 8),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 45,
              width: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: MyColors.blackOpacity)
              ),
              child: MyText(title: "ارفع صور", color: MyColors.black, size: 12),
            ),
          )
        ],
      ),
    );
  }
}

