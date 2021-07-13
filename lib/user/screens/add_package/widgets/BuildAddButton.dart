part of 'AddPackageWidgetImports.dart';

class BuildAddButton extends StatelessWidget {
  final AddPackageData packageData;
  final PackageType type;
  const BuildAddButton({required this.packageData, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: LoadingButton(
        title: tr(context, "addPackage"),
        onTap: ()=> packageData.onSavePackage(context, type),
        btnKey: packageData.btnKey,
        color: MyColors.secondary,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      ),
    );
  }
}
