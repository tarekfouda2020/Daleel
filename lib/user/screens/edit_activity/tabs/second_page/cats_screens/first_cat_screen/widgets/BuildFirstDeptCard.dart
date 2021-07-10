part of 'SecondPageWidgetsImports.dart';

class BuildFirstDeptCard extends StatelessWidget {
  final String title;
  final AddDeptModel  model;
  final Function(AddDeptModel) onSave;
  const BuildFirstDeptCard({required this.title, required this.model, required this.onSave});
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
                  BuildFormField(title: "اسم القسم",controller: model.allDeptFields[7].value,),
                  BuildFormField(title: "سعة القسم",controller: model.allDeptFields[8].value,),
                  RichTextFiled(
                    controller: model.allDeptFields[9].value,
                    label: "اكتب وصف مختصر بالعربي",
                    margin: EdgeInsets.only(top: 15),
                    max: 3,
                    action: TextInputAction.next,
                    fillColor: MyColors.white,
                    validate: (value)=> value!.noValidate(),
                  ),
                  RichTextFiled(
                    controller: model.allDeptFields[10].value,
                    label: "اكتب وصف مختصر بالانجليزي",
                    margin: EdgeInsets.only(top: 15),
                    max: 3,
                    action: TextInputAction.next,
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
                        child: BuildFormField(title: "السبت",controller: model.allDeptFields[0].value,),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BuildFormField(title: "الاحد",controller: model.allDeptFields[1].value,),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: BuildFormField(title: "الاثنين",controller: model.allDeptFields[2].value,),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BuildFormField(title: "الثلاثاء",controller: model.allDeptFields[3].value,),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: BuildFormField(title: "الاربعاء",controller: model.allDeptFields[4].value,),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BuildFormField(title: "الخميس",controller: model.allDeptFields[5].value,),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: BuildFormField(title: "الجمعة",controller: model.allDeptFields[6].value,),
                      ),
                    ],
                  ),
                  DefaultButton(
                    title: "حفظ",
                    margin: EdgeInsets.symmetric(vertical: 15),
                    color: MyColors.bg,
                    textColor: MyColors.secondary,
                    onTap: ()=>onSave(model),
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
