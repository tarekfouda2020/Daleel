part of 'ActivitiesWidgetImports.dart';

class BuildActivityItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: MyColors.greyWhite),
          borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            height: 15,
            decoration: BoxDecoration(
                color: MyColors.secondary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      title: "استراحة الشاذلية",
                      color: MyColors.blackOpacity,
                      size: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    MyText(
                      title: "الاقسام : 2",
                      color: MyColors.blackOpacity,
                      size: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                MyText(
                  title: "استراحات وشاليهات",
                  color: MyColors.blackOpacity,
                  size: 10,
                  fontWeight: FontWeight.w500,
                ),
                MyText(
                  title: "جدة",
                  color: MyColors.blackOpacity,
                  size: 10,
                  fontWeight: FontWeight.w500,
                ),
                MyText(
                  title: "١٢٠٠ ريال",
                  color: MyColors.blackOpacity,
                  size: 10,
                  fontWeight: FontWeight.w500,
                ),
                Container(
                  margin: EdgeInsets.only(top: 5,right: 5,left: 5),
                  child: Row(
                    children: [
                      BuildActivityAction(
                        title: "تعديل",
                        onTap: (){},
                        iconData: Icons.edit,
                      ),
                      SizedBox(width: 20),
                      BuildActivityAction(
                        title: "عرض",
                        onTap: (){},
                        iconData: Icons.add,
                      ),
                      Spacer(),
                      BuildActivityAction(
                        title: "مفعل",
                        color: MyColors.secondary,
                        onTap: (){},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
