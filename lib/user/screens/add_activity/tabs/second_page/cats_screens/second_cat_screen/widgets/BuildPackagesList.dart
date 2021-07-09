part of  'PackagesWidgetImports.dart';

class BuildPackagesList extends StatelessWidget {
  final List<AddPackageModel> data;

  const BuildPackagesList({required this.data});
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
          ...data.map((e) => BuildPackageItem(model: e)).toList(),
          BuildAddPackageAction(),
        ],
      ),
    );
  }
}

