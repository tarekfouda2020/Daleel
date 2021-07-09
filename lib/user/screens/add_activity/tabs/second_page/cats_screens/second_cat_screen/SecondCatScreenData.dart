part of 'SecondCatScreenImports.dart';

class SecondCatScreenData{

  final PackageCubit packageCubit = new PackageCubit();

  setChangeType(PackageType type){
    packageCubit.state.model.type=type;
    print(type);
    packageCubit.onUpdateData(packageCubit.state.model);
  }

}