part of 'PackagesWidgetImports.dart';

class BuildTypesView extends StatelessWidget {
  final PackageType type;
  final SecondCatScreenData screenData;

  const BuildTypesView({required this.type, required this.screenData});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: BuildTypeAction(
              selected: type==PackageType.person,
              onTap: () => screenData.setChangeType(PackageType.person),
              title: "السعر بالفرد",
            ),
          ),
          Expanded(
            child: BuildTypeAction(
              selected: type==PackageType.package,
              onTap: () => screenData.setChangeType(PackageType.package),
              title: "السعر بالبكدج",
            ),
          ),
        ],
      ),
    );
  }
}
