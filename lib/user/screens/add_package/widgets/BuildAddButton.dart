part of 'AddPackageWidgetImports.dart';

class BuildAddButton extends StatelessWidget {
  final AddPackageData packageData;

  const BuildAddButton({required this.packageData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: LoadingButton(
        title: "اضافة الباكيدج",
        onTap: (){},
        btnKey: packageData.btnKey,
        color: MyColors.secondary,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      ),
    );
  }
}
