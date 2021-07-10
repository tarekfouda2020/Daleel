part of 'PackagesWidgetImports.dart';

class BuildPackageItem extends StatelessWidget {
  final AddPackageModel model;

  const BuildPackageItem({required this.model});
  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10),
      child: DottedBorder(
        color: MyColors.grey,
        strokeWidth: 1,
        radius: Radius.circular(20),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: (lang=="ar"? model.nameAr:model.nameEn)??"",
              color: Colors.black54,
              size: 10,
              fontWeight: FontWeight.w600,
            ),
            MyText(
              title: "عدد الافراد : ${model.numberOfPersons} فرد",
              color: Colors.black54,
              size: 10,
              fontWeight: FontWeight.w600,
            ),
            MyText(
              title: "سعر الباكدج : ${model.packagePrice} ريال",
              color: Colors.black54,
              size: 10,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
