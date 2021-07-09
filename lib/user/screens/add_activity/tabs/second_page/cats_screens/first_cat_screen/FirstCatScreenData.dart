part of 'FirstCatScreenImports.dart';

class FirstCatScreenData{

  AddDeptModel allSectionsPrice=AddDeptModel(false);
  AddDeptModel firstSectionPrice=AddDeptModel(false);
  AddDeptModel secondSectionPrice=AddDeptModel(false);

  setSaveAllPrice(AddDeptModel model,int type){
    var len = model.allDeptFields
        .where((element) => element.value.text.isEmpty)
        .toList().length;
    if (type==1) {
      len = model.allDeptFields
          .where((element) => element.value.text.isEmpty
          &&!element.name.contains("description")
          &&!element.name.contains("name")).toList().length;
    }
    if (len>0) {
      LoadingDialog.showSimpleToast("من فضلك قم باستكمال البيانات");
      return;
    }
    model.saved=true;
    LoadingDialog.showToastNotification("تم حفظ البيانات بنجاح",color: MyColors.primary);
  }

  saveDataToModel(AddActivityData addActivityData){
    if (!allSectionsPrice.saved) {
      LoadingDialog.showSimpleToast("من فضلك قم باستكمال البيانات الالزامية");
      return;
    }
    addActivityData.activityModel.allSectionsPrice=allSectionsPrice;
    addActivityData.activityModel.firstSectionPrice=firstSectionPrice;
    addActivityData.activityModel.secondSectionPrice=secondSectionPrice;
    addActivityData.goToNextPage();
  }

}