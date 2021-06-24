part of 'FirstPageWidgetImports.dart';

class BuildTypesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(title: "اختر النوع", color: MyColors.primary, size: 10),
          SizedBox(height: 5),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: MyColors.secondary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: 1,
                      onChanged: (value) {},
                    ),
                    MyText(title: "قاعة الافراح", color: MyColors.black, size: 10)
                  ],
                ),
                Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: 2,
                      onChanged: (value) {},
                    ),
                    MyText(title: "قاعة الافراح", color: MyColors.black, size: 10)
                  ],
                ),
                Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: 2,
                      onChanged: (value) {},
                    ),
                    MyText(title: "قاعة الافراح", color: MyColors.black, size: 10)
                  ],
                ),
                Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: 2,
                      onChanged: (value) {},
                    ),
                    MyText(title: "قاعة الافراح", color: MyColors.black, size: 10)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
