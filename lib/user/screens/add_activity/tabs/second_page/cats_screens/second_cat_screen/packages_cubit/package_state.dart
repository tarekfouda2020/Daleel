part of 'package_cubit.dart';

abstract class PackageState extends Equatable {
  final PackagesTypeModel model;
  final bool change;
  const PackageState(this.model,this.change);
}

class PackageInitial extends PackageState {
  PackageInitial() : super(PackagesTypeModel(), false);

  @override
  List<Object> get props => [model,change];
}

class PackageUpdateState extends PackageState {
  PackageUpdateState(PackagesTypeModel model, bool change) : super(model, change);

  @override
  List<Object> get props => [model,change];
}
