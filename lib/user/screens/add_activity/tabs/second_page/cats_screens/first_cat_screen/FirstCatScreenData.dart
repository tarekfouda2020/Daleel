part of 'FirstCatScreenImports.dart';

class FirstCatScreenData{

  AddDeptModel allSectionsPrice=AddDeptModel(false);
  AddDeptModel firstSectionPrice=AddDeptModel(false);
  AddDeptModel secondSectionPrice=AddDeptModel(false);

  setSaveAllPrice(AddDeptModel model,int type,BuildContext context){
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
      LoadingDialog.showSimpleToast(tr(context,"completeYourData"));
      return;
    }
    model.saved=true;
    LoadingDialog.showToastNotification(tr(context, "dataSavedSuccessfully"),color: MyColors.primary);
  }

  saveDataToModel(AddActivityData addActivityData,BuildContext context){
    if (!allSectionsPrice.saved) {
      LoadingDialog.showSimpleToast(tr(context,"completeYourData"));
      return;
    }
    Map<String,dynamic> all={};
    Map<String,dynamic> first={};
    Map<String,dynamic> second={};
    allSectionsPrice.allDeptFields.forEach((e) {
      all[e.name]= e.name=="description"||e.name=="description_ar"||
          e.name=="name"? e.value.text : double.parse(e.value.text);
    });
    if (firstSectionPrice.saved) {
      firstSectionPrice.allDeptFields.forEach((e) {
        first[e.name]=e.name=="description"||e.name=="description_ar"||
            e.name=="name"? e.value.text : double.parse(e.value.text);
      });
    }
    if (secondSectionPrice.saved) {
      secondSectionPrice.allDeptFields.forEach((e) {
        second[e.name]=e.name=="description"||e.name=="description_ar"||
            e.name=="name"? e.value.text : double.parse(e.value.text);
      });
    }
    all["name"]=addActivityData.activityModel.nameEn;
    addActivityData.activityModel.allSectionsPrice=all;
    addActivityData.activityModel.firstSectionPrice=first;
    addActivityData.activityModel.secondSectionPrice=second;
    addActivityData.goToNextPage();
  }

}