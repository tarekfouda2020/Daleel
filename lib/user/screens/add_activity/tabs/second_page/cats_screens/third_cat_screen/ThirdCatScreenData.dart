part of 'ThirdCatScreenImports.dart';

class ThirdCatScreenData{

  GlobalKey<FormState> formKey = new GlobalKey();

  TextEditingController price = TextEditingController();
  TextEditingController opacity = TextEditingController();

  saveDataToModel(AddActivityData addActivityData){
    if (formKey.currentState!.validate()) {
      addActivityData.activityModel.price=double.parse(price.text);
      addActivityData.activityModel.opacity=int.parse(opacity.text);
      addActivityData.goToNextPage();
    }
  }

}