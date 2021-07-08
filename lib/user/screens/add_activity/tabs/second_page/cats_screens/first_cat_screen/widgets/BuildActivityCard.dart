part of 'SecondPageWidgetsImports.dart';

class BuildActivityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MyText(
            title: "النشاط كاملا",
            color: MyColors.secondary,
            size: 16,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                MyText(
                  title: "الزامي",
                  color: Colors.red,
                  size: 10,
                ),
              ],
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  BuildFormField(title: "السعة الكلية"),
                  Row(
                    children: [
                      Expanded(
                        child: MyText(
                          title: "السعر باليوم",
                          color: MyColors.secondary,
                          size: 12,
                          fontWeight: FontWeight.w600,
                          alien: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: BuildFormField(title: "السبت"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BuildFormField(title: "الاحد"),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: BuildFormField(title: "الاثنين"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BuildFormField(title: "الثلاثاء"),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: BuildFormField(title: "الاربعاء"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BuildFormField(title: "الخميس"),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: BuildFormField(title: "الجمعة"),
                      ),
                    ],
                  ),
                  DefaultButton(
                    title: "حفظ",
                    margin: EdgeInsets.symmetric(vertical: 15),
                    color: MyColors.bg,
                    textColor: MyColors.secondary,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
