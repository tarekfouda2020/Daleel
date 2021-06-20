part of 'HomeMainWidgetsImports.dart';

class BuildFilterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
        color: MyColors.bg,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Res.search,
                  color: MyColors.grey,
                  width: 20,
                  height: 20,
                ),
                SizedBox(width: 10),
                MyText(title: "ابحث برقم الحجز", color: Colors.black54, size: 8,fontWeight: FontWeight.w600,)
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Res.filter,
                  color: MyColors.grey,
                  width: 15,
                  height: 15,
                  alignment: Alignment.center,
                ),
                SizedBox(width: 10),
                MyText(title: "فلتر الحجوزات", color: Colors.black54, size: 8,fontWeight: FontWeight.w600,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

