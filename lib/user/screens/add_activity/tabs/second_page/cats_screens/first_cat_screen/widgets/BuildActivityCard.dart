part of 'SecondPageWidgetsImports.dart';


class BuildActivityCard extends StatelessWidget {
  final AddDeptModel  model;
  final Function(AddDeptModel) onSave;
  const BuildActivityCard({required this.model, required this.onSave});
  @override
  Widget build(BuildContext context) {
    return Form(
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
                  BuildFormField(title: "السعة الكلية",controller: model.allDeptFields[8].value,),
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
