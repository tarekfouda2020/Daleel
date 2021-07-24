part of 'AddPackageWidgetImports.dart';

class BuildAddButton extends StatelessWidget {
  final EditPackageData packageData;
  final PackageType type;
  final int index;
  const BuildAddButton({required this.packageData, required this.type, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: LoadingButton(
        title: tr(context, "editPackage"),
        onTap: ()=> packageData.onSavePackage(context, type,index),
        btnKey: packageData.btnKey,
        color: MyColors.secondary,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      ),
    );
  }
}
