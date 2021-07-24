part of  'PackagesWidgetImports.dart';

class BuildPackagesList extends StatelessWidget {
  final List<AddPackageModel> data;
  final SecondCatScreenData screenData;

  const BuildPackagesList({required this.data, required this.screenData});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      decoration: BoxDecoration(
        color: MyColors.fillColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)
        )
      ),
      child: Column(
        children: [
          ...data.map((e) => BuildPackageItem(model: e,screenData: screenData,)).toList(),
          BuildAddPackageAction(type: PackageType.package,screenData: screenData,),
        ],
      ),
    );
  }
}

