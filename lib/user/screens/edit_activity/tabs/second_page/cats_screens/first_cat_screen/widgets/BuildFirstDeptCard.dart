part of 'SecondPageWidgetsImports.dart';

class BuildFirstDeptCard extends StatelessWidget {
  final String title;
  final AddDeptModel model;
  final EditActivityData addActivityData;
  final int state;
  final int type;

  const BuildFirstDeptCard({
    required this.title,
    required this.model,
    required this.state,
    required this.type,
    required this.addActivityData,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: state >= type,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  title: title,
                  color: MyColors.secondary,
                  size: 16,
                ),
                IconButton(
                  onPressed: ()=> addActivityData.firstCatScreenData.setRemoveDept(type,addActivityData),
                  icon: Icon(Icons.remove_circle,size: 25,color: MyColors.redColor,),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  MyText(
                    title: tr(context, "optional"),
                    color: MyColors.blackOpacity,
                    size: 10,
                  ),
                ],
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    BuildFormField(
                      title: tr(context, "deptName"),
                      type: TextInputType.text,
                      controller: model.allDeptFields[7].value,
                    ),
                    BuildFormField(
                      title: tr(context, "deptCapacity"),
                      type: TextInputType.text,
                      controller: model.allDeptFields[8].value,
                    ),
                    RichTextFiled(
                      controller: model.allDeptFields[9].value,
                      label: tr(context, "shortDescAr"),
                      margin: EdgeInsets.only(top: 15),
                      max: 3,
                      action: TextInputAction.next,
                      fillColor: MyColors.white,
                      validate: (value) => value!.noValidate(),
                    ),
                    RichTextFiled(
                      controller: model.allDeptFields[10].value,
                      label: tr(context, "shortDescEn"),
                      margin: EdgeInsets.only(top: 15),
                      max: 3,
                      action: TextInputAction.next,
                      fillColor: MyColors.white,
                      validate: (value) => value!.noValidate(),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MyText(
                            title: tr(context, "pricePerDay"),
                            color: MyColors.secondary,
                            size: 12,
                            fontWeight: FontWeight.w600,
                            alien: TextAlign.center,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: BuildFormField(
                            title: tr(context, "saturday"),
                            controller: model.allDeptFields[0].value,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: BuildFormField(
                            title: tr(context, "sunday"),
                            controller: model.allDeptFields[1].value,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: BuildFormField(
                            title: tr(context, "monday"),
                            controller: model.allDeptFields[2].value,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: BuildFormField(
                            title: tr(context, "thursday"),
                            controller: model.allDeptFields[3].value,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: BuildFormField(
                            title: tr(context, "wenesday"),
                            controller: model.allDeptFields[4].value,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: BuildFormField(
                            title: tr(context, "thursday"),
                            controller: model.allDeptFields[5].value,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: BuildFormField(
                            title: tr(context, "friday"),
                            controller: model.allDeptFields[6].value,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
