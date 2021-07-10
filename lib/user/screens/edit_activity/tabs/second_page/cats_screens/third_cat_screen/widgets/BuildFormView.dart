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
              title: "السعر",
              color: MyColors.blackOpacity,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            LabelTextField(
              controller: pageData.price,
              margin: EdgeInsets.symmetric(vertical: 10),
              hint: "ادخل سعر ",
              type: TextInputType.number,
              filledColor: MyColors.white,
              validate: (value)=> value!.validateEmpty(context),
            ),
            MyText(
              title: "السعة الكلية",
              color: MyColors.blackOpacity,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            LabelTextField(
              controller: pageData.capacity,
              margin: EdgeInsets.symmetric(vertical: 10),
              hint: "ادخل السعة",
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
