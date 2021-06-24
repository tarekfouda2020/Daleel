part of 'PackagesWidgetImports.dart';

class BuildPackagesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          BuildTypesView(),
          BuildPackagesList(),
        ],
      ),
    );
  }
}

