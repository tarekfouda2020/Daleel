part of 'PackagesWidgetImports.dart';

class BuildPackagesCard extends StatelessWidget {
  final SecondCatScreenData screenData;

  const BuildPackagesCard({required this.screenData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: BlocBuilder<PackageCubit, PackageState>(
        bloc: screenData.packageCubit,
        builder: (context, state) {
          return Column(
            children: [
              BuildTypesView(
                type: state.model.type,
                screenData: screenData,
              ),
              PageTransitionSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder:
                    (child, primaryAnimation, secondaryAnimation) {
                  return ScaleTransition(
                    scale: primaryAnimation,
                    child: child,
                  );
                },
                child:state.model.type==PackageType.package?
                BuildPackagesList(data: state.model.packages, screenData: screenData,):
                BuildPersonsList(data: state.model.persons, screenData: screenData,),
              ),
            ],
          );
        },
      ),
    );
  }
}
