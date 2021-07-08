part of 'SecondPageWidgetsImports.dart';

class BuildFirstDeptCard extends StatelessWidget {
  final String title;

  const BuildFirstDeptCard({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          MyText(
            title: title,
            color: MyColors.secondary,
            size: 16,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                MyText(
                  title: "اختياري",
                  color: MyColors.blackOpacity,
                  size: 10,
                ),
              ],
            ),
          ),
          Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  BuildFormField(title: "اسم القسم"),
                  BuildFormField(title: "سعة القسم"),
                  RichTextFiled(
                    label: "اكتب وصف مختصر بالعربي",
                    margin: EdgeInsets.only(top: 15),
                    max: 3,
                    fillColor: MyColors.white,
                    validate: (value)=> value!.noValidate(),
                  ),
                  RichTextFiled(
                    label: "اكتب وصف مختصر بالانجليزي",
                    margin: EdgeInsets.only(top: 15),
                    max: 3,
                    fillColor: MyColors.white,
                    validate: (value)=> value!.noValidate(),
                  ),
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
