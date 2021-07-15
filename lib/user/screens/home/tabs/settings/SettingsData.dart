part of 'SettingsImports.dart';

class SettingsData{

  logout(BuildContext context){
    Utils.clearSavedData();
    Phoenix.rebirth(context);
  }

}