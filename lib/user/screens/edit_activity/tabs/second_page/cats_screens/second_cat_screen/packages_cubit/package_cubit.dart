import 'package:base_flutter/user/models/Dtos/PackagesTypeModel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'package_state.dart';

class PackageCubit extends Cubit<PackageState> {
  PackageCubit() : super(PackageInitial());

  onUpdateData(PackagesTypeModel model){
    emit(PackageUpdateState(model, !state.change));
  }

}
