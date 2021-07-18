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
            title: tr(context,"holeActivity"),
            color: MyColors.secondary,
            size: 16,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                MyText(
                  title: tr(context,"required"),
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
                  BuildFormField(title: tr(context, "holeCapacity"),controller: model.allDeptFields[8].value,),
                  Row(
                    children: [
                      Expanded(
                        child: MyText(
                          title: tr(context,"pricePerDay"),
                          color: MyColors.secondary,
                          size: 12,
                          fontWeight: FontWeight.w600,
                          alien: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: BuildFormField(title: tr(context, "saturday"),controller: model.allDeptFields[0].value,),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BuildFormField(title: tr(context, "sunday"),controller: model.allDeptFields[1].value,),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: BuildFormField(title: tr(context, "monday"),controller: model.allDeptFields[2].value,),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BuildFormField(title: tr(context, "thursday"),controller: model.allDeptFields[3].value,),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: BuildFormField(title: tr(context, "wenesday"),controller: model.allDeptFields[4].value,),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BuildFormField(title: tr(context, "thursday"),controller: model.allDeptFields[5].value,),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: BuildFormField(title: tr(context, "friday"),controller: model.allDeptFields[6].value,),
                      ),
                    ],
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
