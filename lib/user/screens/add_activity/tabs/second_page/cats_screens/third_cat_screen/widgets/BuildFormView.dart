part of 'ThirdCatWidgetImports.dart';

class BuildFormView extends StatelessWidget {
  final ThirdCatScreenData pageData;

  const BuildFormView({required this.pageData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      child: Form(
        key: pageData.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: tr(context, "price"),
              color: MyColors.blackOpacity,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            LabelTextField(
              controller: pageData.price,
              margin: EdgeInsets.symmetric(vertical: 10),
              hint: tr(context, "enterPrice"),
              type: TextInputType.number,
              filledColor: MyColors.white,
              validate: (value)=> value!.validateEmpty(context),
            ),
            MyText(
              title: tr(context,"holeCapacity"),
              color: MyColors.blackOpacity,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            LabelTextField(
              controller: pageData.opacity,
              margin: EdgeInsets.symmetric(vertical: 10),
              hint: tr(context, "enterCapacity"),
              type: TextInputType.number,
              filledColor: MyColors.white,
              validate: (value)=> value!.validateEmpty(context),
            ),
          ],
        ),
      ),
    );
  }
}
