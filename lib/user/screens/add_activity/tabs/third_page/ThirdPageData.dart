part of 'ThirdPageImports.dart';

class ThirdPageData{

  final GlobalKey<FormState> formKey = new GlobalKey();

  final TextEditingController descAr = new TextEditingController();
  final TextEditingController descEn = new TextEditingController();
  final TextEditingController termsAr = new TextEditingController();
  final TextEditingController termsEn = new TextEditingController();

  SubCategoryModel? subCategoryModel;
  CityModel? locModel;

  onSubCatChange(SubCategoryModel? model){
    subCategoryModel = model;
  }
  onLocationChange(CityModel? model){
    locModel = model;
  }

  setAddDataToModel(AddActivityData addActivityData){
    if (formKey.currentState!.validate()) {
      addActivityData.activityModel.allSectionsPrice!["description"]=descEn.text;
      addActivityData.activityModel.allSectionsPrice!["description_ar"]=descAr.text;
      addActivityData.activityModel.termsEn = termsEn.text;
      addActivityData.activityModel.termsAr = termsAr.text;
      addActivityData.activityModel.subCategory = [subCategoryModel!.id];
      addActivityData.activityModel.occasions = [locModel!.id];

      addActivityData.goToNextPage();
    }
  }

}