import 'package:base_flutter/user/models/SettingModel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());

  onUpdateSettings(SettingModel model){
    emit(SettingUpdateState(model,!state.changed));
  }

}
