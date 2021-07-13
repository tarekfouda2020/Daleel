part of 'SecondCatScreenImports.dart';

class SecondCatScreenData{

  final PackageCubit packageCubit = new PackageCubit();

  setChangeType(PackageType type){
    packageCubit.state.model.type=type;
    print(type);
    packageCubit.onUpdateData(packageCubit.state.model);
  }

  savePackagesToModel(EditActivityData activityData,BuildContext context){
    var packages = packageCubit.state.model.packages;
    var persons = packageCubit.state.model.persons;
    if (persons.length==0&&packages.length==0) {
      LoadingDialog.showSimpleToast(tr(context, "enterOnePackage"));
      return;
    }
    activityData.activityModel.personPrices=persons;
    activityData.activityModel.packagePrices=packages;
    activityData.goToNextPage();
  }

}