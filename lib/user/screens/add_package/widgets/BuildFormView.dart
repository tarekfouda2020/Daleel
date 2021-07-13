part of 'AddPackageWidgetImports.dart';

class BuildFormView extends StatelessWidget {
  final AddPackageData packageData;
  final PackageType type;

  const BuildFormView({required this.packageData, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: packageData.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: tr(context, "packageNameAr"),
              color: MyColors.blackOpacity,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            LabelTextField(
              controller: packageData.nameAr,
              margin: EdgeInsets.symmetric(vertical: 10),
              hint: tr(context, "enterPackageNameAr"),
              type: TextInputType.name,
              filledColor: MyColors.white,
              validate: (value)=> value!.validateEmpty(context),
            ),
            SizedBox(height: 10),
            MyText(
              title: tr(context, "packageNameEn"),
              color: MyColors.blackOpacity,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            LabelTextField(
              controller: packageData.nameEn,
              margin: EdgeInsets.symmetric(vertical: 10),
              hint: tr(context, "enterPackageNameEn"),
              type: TextInputType.name,
              filledColor: MyColors.white,
              validate: (value)=> value!.validateEmpty(context),
            ),
            MyText(
              title: tr(context, "packageDesAr"),
              color: MyColors.blackOpacity,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            RichTextFiled(
              controller: packageData.descAr,
              margin: EdgeInsets.symmetric(vertical: 10),
              hint: tr(context, "enterPackageDesAr"),
              type: TextInputType.name,
              fillColor: MyColors.white,
              max: 3,
              validate: (value)=> value!.validateEmpty(context),
            ),
            SizedBox(height: 10),
            MyText(
              title: tr(context,"packageDesEn"),
              color: MyColors.blackOpacity,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            RichTextFiled(
              controller: packageData.descEn,
              margin: EdgeInsets.symmetric(vertical: 10),
              hint: tr(context, "enterPackageDesEn"),
              type: TextInputType.name,
              fillColor: MyColors.white,
              max: 3,
              validate: (value)=> value!.validateEmpty(context),
            ),
            Visibility(
              visible: type==PackageType.package,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: tr(context,"userNum"),
                    color: MyColors.blackOpacity,
                    size: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  LabelTextField(
                    controller: packageData.number,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    hint: tr(context,"enterUserNum"),
                    type: TextInputType.number,
                    filledColor: MyColors.white,
                    validate: (value)=> value!.validateEmpty(context),
                  ),
                ],
              ),
              replacement: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: tr(context,"userMin"),
                    color: MyColors.blackOpacity,
                    size: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  LabelTextField(
                    controller: packageData.minNum,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    hint:  tr(context,"enterUserMin"),
                    type: TextInputType.number,
                    filledColor: MyColors.white,
                    validate: (value)=> value!.validateEmpty(context),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: type!=PackageType.package,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: tr(context,"userMax"),
                    color: MyColors.blackOpacity,
                    size: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  LabelTextField(
                    controller: packageData.maxNum,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    hint: tr(context,"enterUserMax"),
                    type: TextInputType.number,
                    filledColor: MyColors.white,
                    validate: (value)=> value!.validateEmpty(context),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Visibility(
              visible: type==PackageType.package,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: tr(context, "packagePrice"),
                    color: MyColors.blackOpacity,
                    size: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  LabelTextField(
                    controller: packageData.price,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    hint: tr(context, "enterPackagePrice"),
                    type: TextInputType.number,
                    filledColor: MyColors.white,
                    validate: (value)=> value!.validateEmpty(context),
                  ),
                ],
              ),
              replacement: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: tr(context,"personPrice"),
                    color: MyColors.blackOpacity,
                    size: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  LabelTextField(
                    controller: packageData.pricePerPerson,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    hint: tr(context,"enterPersonPrice"),
                    type: TextInputType.number,
                    filledColor: MyColors.white,
                    validate: (value)=> value!.validateEmpty(context),
                  ),
                ],
              ),
            ),

            MyText(
              title: tr(context, "reservationPerDay"),
              color: MyColors.blackOpacity,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            LabelTextField(
              controller: packageData.numberOfReservations,
              margin: EdgeInsets.symmetric(vertical: 10),
              hint: tr(context, "enterReservationPerDay"),
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
