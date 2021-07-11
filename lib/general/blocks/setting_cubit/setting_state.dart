part of 'setting_cubit.dart';

abstract class SettingState extends Equatable {
  final SettingModel? model;
  final bool changed;
  const SettingState(this.model, this.changed);
}

class SettingInitial extends SettingState {
  SettingInitial() : super(null, false);

  @override
  List<Object> get props => [changed];
}


class SettingUpdateState extends SettingState {
  SettingUpdateState(SettingModel model, bool changed) : super(model, changed);

  @override
  List<Object> get props => [ changed];
}
