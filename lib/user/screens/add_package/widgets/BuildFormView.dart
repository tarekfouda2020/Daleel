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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: "اسم الباكيدج بالعربي",
              color: MyColors.blackOpacity,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            LabelTextField(
              controller: packageData.nameAr,
              margin: EdgeInsets.symmetric(vertical: 10),
              hint: "ادخل الاسم بالعربي",
              type: TextInputType.name,
              filledColor: MyColors.white,
              validate: (value)=> value!.validateEmpty(context),
            ),
            SizedBox(height: 10),
            MyText(
              title: "اسم الباكيدج بالانجليزي",
              color: MyColors.blackOpacity,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            LabelTextField(
              controller: packageData.nameEn,
              margin: EdgeInsets.symmetric(vertical: 10),
              hint: "ادخل الاسم بالانجليزي",
              type: TextInputType.name,
              filledColor: MyColors.white,
              validate: (value)=> value!.validateEmpty(context),
            ),
            MyText(
              title: "وصف الباكيدج بالعربي",
              color: MyColors.blackOpacity,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            RichTextFiled(
              controller: packageData.descAr,
              margin: EdgeInsets.symmetric(vertical: 10),
              hint: "ادخل الوصف بالعربي",
              type: TextInputType.name,
              fillColor: MyColors.white,
              max: 3,
              validate: (value)=> value!.validateEmpty(context),
            ),
            SizedBox(height: 10),
            MyText(
              title: "وصف الباكيدج بالانجليزي",
              color: MyColors.blackOpacity,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            RichTextFiled(
              controller: packageData.descEn,
              margin: EdgeInsets.symmetric(vertical: 10),
              hint: "ادخل الوصف بالانجليزي",
              type: TextInputType.name,
              fillColor: MyColors.white,
              max: 3,
              validate: (value)=> value!.validateEmpty(context),
            ),
            Visibility(
              visible: type==PackageType.package,
              child: Column(
                children: [
                  MyText(
                    title: "عدد الافراد",
                    color: MyColors.blackOpacity,
                    size: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  LabelTextField(
                    controller: packageData.number,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    hint: "ادخل عدد الافراد",
                    type: TextInputType.number,
                    filledColor: MyColors.white,
                    validate: (value)=> value!.validateEmpty(context),
                  ),
                ],
              ),
              replacement: Column(
                children: [
                  MyText(
                    title: "الحد الادني للافراد",
                    color: MyColors.blackOpacity,
                    size: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  LabelTextField(
                    controller: packageData.minNum,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    hint: "ادخل الحد الادني",
                    type: TextInputType.number,
                    filledColor: MyColors.white,
                    validate: (value)=> value!.validateEmpty(context),
                  ),
                ],
              ),
            ),
            Offstage(
              offstage: type==PackageType.package,
              child: Column(
                children: [
                  MyText(
                    title: "الحد الاقصي للافراد",
                    color: MyColors.blackOpacity,
                    size: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  LabelTextField(
                    controller: packageData.maxNum,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    hint: "ادخل الاقصي الادني",
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
                children: [
                  MyText(
                    title: "سعر الباكدج",
                    color: MyColors.blackOpacity,
                    size: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  LabelTextField(
                    controller: packageData.price,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    hint: "ادخل سعر الباكيدج",
                    type: TextInputType.number,
                    filledColor: MyColors.white,
                    validate: (value)=> value!.validateEmpty(context),
                  ),
                ],
              ),
              replacement: Column(
                children: [
                  MyText(
                    title: "السعر للفرد",
                    color: MyColors.blackOpacity,
                    size: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  LabelTextField(
                    controller: packageData.pricePerPerson,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    hint: "ادخل سعر الفرد",
                    type: TextInputType.number,
                    filledColor: MyColors.white,
                    validate: (value)=> value!.validateEmpty(context),
                  ),
                ],
              ),
            ),

            MyText(
              title: "عدد الحجوزات في اليوم",
              color: MyColors.blackOpacity,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            LabelTextField(
              controller: packageData.numberOfReservations,
              margin: EdgeInsets.symmetric(vertical: 10),
              hint: "ادخل عدد الحجوزات",
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
