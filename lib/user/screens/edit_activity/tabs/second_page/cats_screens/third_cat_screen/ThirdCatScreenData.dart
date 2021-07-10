part of 'ThirdCatScreenImports.dart';

class ThirdCatScreenData{

  GlobalKey<FormState> formKey = new GlobalKey();

  TextEditingController price = TextEditingController();
  TextEditingController capacity = TextEditingController();

  saveDataToModel(EditActivityData addActivityData){
    if (formKey.currentState!.validate()) {
      addActivityData.activityModel.price=double.parse(price.text);
      addActivityData.activityModel.opacity=int.parse(capacity.text);
      addActivityData.goToNextPage();
    }
  }

}