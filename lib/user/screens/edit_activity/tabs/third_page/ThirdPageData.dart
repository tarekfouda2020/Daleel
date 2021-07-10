part of 'ThirdPageImports.dart';

class ThirdPageData{

  final GlobalKey<FormState> formKey = new GlobalKey();

  final TextEditingController descAr = new TextEditingController();
  final TextEditingController descEn = new TextEditingController();
  final TextEditingController termsAr = new TextEditingController();
  final TextEditingController termsEn = new TextEditingController();

  GenericBloc<List<SubCategoryModel>> subCubit = new GenericBloc([]);
  GenericBloc<List<CityModel>> locCubit = new GenericBloc([]);


  List<SubCategoryModel> allSub = [];
  List<SubCategoryModel> selectedSub = [];
  List<CityModel> allLoc = [];
  List<CityModel> selectedLoc = [];

  Future<void> getSubCats(BuildContext context, String catId, {bool refresh = true})async{
    allSub= await UserRepository(context).getSubCategories(catId, refresh);
    subCubit.onUpdateData(allSub);
    var filters = allSub.where((e) => selectedSub.where((x) => e.id==x.id).length>0).toList();
    onSelectSubCat(filters);
  }

  void onSelectSubCat(List<SubCategoryModel> subs){
    selectedSub = subs;
  }

  void onSubCatClick(SubCategoryModel option){
    selectedSub.remove(option);
    subCubit.onUpdateData(allSub);
  }

  Future<void> getLocations(BuildContext context, {bool refresh = true})async{
    allLoc= await UserRepository(context).getLocations(refresh);
    locCubit.onUpdateData(allLoc);
    var filters = allLoc.where((e) => selectedLoc.where((x) => e.id==x.id).length>0).toList();
    onSelectLocation(filters);
  }

  void onSelectLocation(List<CityModel> locations){
    selectedLoc = locations;
  }

  void onLocationClick(CityModel option){
    selectedLoc.remove(option);
    locCubit.onUpdateData(allLoc);
  }

  setAddDataToModel(EditActivityData addActivityData){
    if (formKey.currentState!.validate()) {
      addActivityData.activityModel.allSectionsPrice?["description"]=descEn.text;
      addActivityData.activityModel.allSectionsPrice?["description_ar"]=descAr.text;
      addActivityData.activityModel.descAr = descAr.text;
      addActivityData.activityModel.descEn = descEn.text;
      addActivityData.activityModel.termsEn = termsEn.text;
      addActivityData.activityModel.termsAr = termsAr.text;
      addActivityData.activityModel.subCategory = selectedSub.map((e) => e.id).toList();
      addActivityData.activityModel.occasions = selectedLoc.map((e) => e.id).toList();

      addActivityData.goToNextPage();
    }
  }

}