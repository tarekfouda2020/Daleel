part of 'ActivitiesWidgetImports.dart';

class BuildActivityAction extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final IconData? iconData;
  final Color? color;

  const BuildActivityAction({this.onTap, required this.title, this.iconData, this.color});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: Border.all(color: color??MyColors.greyWhite),
          boxShadow: [
            BoxShadow(color: MyColors.greyWhite,spreadRadius: .5,blurRadius: .5,offset: Offset(.5, 2))
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Offstage(
              offstage: iconData==null,
              child: Icon(iconData,size: 15,color: Colors.black45,),
            ),
            SizedBox(width: 5),
            MyText(
              title: title,
              color: color?? MyColors.blackOpacity,
              size: 9,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

