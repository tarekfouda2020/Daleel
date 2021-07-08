part of 'PackagesWidgetImports.dart';

class BuildPackageItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10),
      child: DottedBorder(
        color: MyColors.grey,
        strokeWidth: 1,
        radius: Radius.circular(20),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: "الخدمة البرونزية",
              color: Colors.black54,
              size: 10,
              fontWeight: FontWeight.w600,
            ),
            MyText(
              title: "عدد الافراد : 150 فرد",
              color: Colors.black54,
              size: 10,
              fontWeight: FontWeight.w600,
            ),
            MyText(
              title: "سعر الباكدج : 900 ريال",
              color: Colors.black54,
              size: 10,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
