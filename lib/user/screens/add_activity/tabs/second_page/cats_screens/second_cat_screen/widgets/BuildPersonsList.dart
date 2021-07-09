part of  'PackagesWidgetImports.dart';

class BuildPersonsList extends StatelessWidget {
  final List<AddpackagePersonModel> data;
  final SecondCatScreenData screenData;

  const BuildPersonsList({required this.data, required this.screenData});
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
          ...data.map((e) => BuildPersonItem(model: e)).toList(),
          BuildAddPackageAction(type: PackageType.person,screenData: screenData,),
        ],
      ),
    );
  }
}

