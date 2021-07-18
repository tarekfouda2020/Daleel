part of 'FirstCatScreenImports.dart';

class FirstCatScreenData{

  AddDeptModel allSectionsPrice=AddDeptModel(false);
  AddDeptModel firstSectionPrice=AddDeptModel(false);
  AddDeptModel secondSectionPrice=AddDeptModel(false);

  final GenericBloc<int> catsCountCubit = new GenericBloc(0);


  setAddDept(){
    int count = catsCountCubit.state.data+1;
    catsCountCubit.onUpdateData(count);
  }

  setRemoveDept(int type){
    if (type==1&&catsCountCubit.state.data==2) {
      LoadingDialog.showSimpleToast("من فضلك احذف القسم الثاني اولا");
      return;
    }
    int count = catsCountCubit.state.data-1;
    catsCountCubit.onUpdateData(count);
  }


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
  }

  saveDataToModel(EditActivityData addActivityData,BuildContext context){
    setSaveAllPrice(addActivityData.firstCatScreenData.allSectionsPrice,1,context);
    if (catsCountCubit.state.data==1) {
      setSaveAllPrice(addActivityData.firstCatScreenData.firstSectionPrice,2,context);
    }
    if (catsCountCubit.state.data==2) {
      setSaveAllPrice(addActivityData.firstCatScreenData.firstSectionPrice,3,context);
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