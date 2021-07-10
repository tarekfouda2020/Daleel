part of 'EditActivityImports.dart';

class EditActivityData{
  final PageController pageController =new PageController();
  EditActivityModel activityModel = new EditActivityModel();

  final GenericBloc<int> stepperCubit = new GenericBloc(0);

  final FirstPageData firstPageData =new FirstPageData();
  final FirstCatScreenData firstCatScreenData =new FirstCatScreenData();
  final SecondCatScreenData secondCatScreenData = new SecondCatScreenData();
  final ThirdCatScreenData thirdCatScreenData = new ThirdCatScreenData();
  final ThirdPageData thirdPageData = new ThirdPageData();
  final FourthPageData fourthPageData = new FourthPageData();


  goToNextPage(){
    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    stepperCubit.onUpdateData(stepperCubit.state.data+1);
  }
  goToPreviousPage(){
    pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    stepperCubit.onUpdateData(stepperCubit.state.data-1);
  }


  setInitialData(BuildContext context,PropertyModel model)async{
    firstPageData.selectCatCubit.onUpdateData(model.category.id);
    activityModel.id=model.id;
    initFirstPageData(model);
    initFirstCatPageData(model);
    initSecondCatPageData(model);
    initThirdCatPageData(model);
    initThirdScreen(model);
    initFourthScreen(model);
    getSubCatsAndOptions(model.category.id, context);
  }

  getSubCatsAndOptions(String catId,BuildContext context){
    fourthPageData.getOptions(context, catId,refresh: false);
    fourthPageData.getOptions(context, catId);
    thirdPageData.getSubCats(context,catId,refresh: false);
    thirdPageData.getSubCats(context,catId);
    thirdPageData.getLocations(context);
    thirdPageData.getLocations(context,refresh: false);

  }

  initFirstPageData(PropertyModel model){
    firstPageData.nameEn.text= model.name;
    firstPageData.nameAr.text= model.translation.ar.name;
    firstPageData.cityModel= model.city;
    firstPageData.normalImagesCubit.state.data.exist=model.images;
    firstPageData.normalImagesCubit.onUpdateData(firstPageData.normalImagesCubit.state.data);
  }

  initFirstCatPageData(PropertyModel model){
    if (model.allSectionsPrice!=null) {
      firstCatScreenData.allSectionsPrice= mapDeptData(model.allSectionsPrice);
    }
    if (model.firstSectionPrice!=null) {
      firstCatScreenData.firstSectionPrice= mapDeptData(model.firstSectionPrice);
    }
    if (model.secondSectionPrice!=null) {
      firstCatScreenData.secondSectionPrice= mapDeptData(model.secondSectionPrice);
    }
  }

  AddDeptModel mapDeptData(DeptPriceModel? model){
    AddDeptModel deptModel = AddDeptModel(true);
    deptModel.allDeptFields[0].value.text=model?.saturdayPrice.toString()??"";
    deptModel.allDeptFields[1].value.text=model?.sundayPrice.toString()??"";
    deptModel.allDeptFields[2].value.text=model?.mondayPrice.toString()??"";
    deptModel.allDeptFields[3].value.text=model?.thursdayPrice.toString()??"";
    deptModel.allDeptFields[4].value.text=model?.wednesPrice.toString()??"";
    deptModel.allDeptFields[5].value.text=model?.tuesdayPrice.toString()??"";
    deptModel.allDeptFields[6].value.text=model?.fridayPrice.toString()??"";
    deptModel.allDeptFields[7].value.text=model?.name.toString()??"";
    deptModel.allDeptFields[8].value.text=model?.capacity.toString()??"";
    deptModel.allDeptFields[9].value.text=model?.description.toString()??"";
    deptModel.allDeptFields[10].value.text=model?.descriptionAr.toString()??"";
    return deptModel;
  }

  initSecondCatPageData(PropertyModel model){
    secondCatScreenData.packageCubit.state.model.packages= model.packagePrices.map((e) => AddPackageModel(
      packagePrice: e.packagePrice,
      numberOfPersons: e.numberOfPersons,
      numberOfBookingsPerDay: e.numberOfBookingsPerDay,
      nameEn: e.name,
      nameAr: e.nameAr,
      descEn: e.description,
      descAr: e.descriptionAr
    )).toList();
    secondCatScreenData.packageCubit.state.model.persons= model.personPrices.map((e) => AddpackagePersonModel(
        packagePrice: e.pricePerPerson,
        numberOfBookingsPerDay: e.numberOfBookingsPerDay,
        maximumCount: e.maximumCount,
        minimumCount: e.minimumCount,
        numberOfPersons: e.maximumCount,
        pricePerPerson: e.pricePerPerson,
        nameEn: e.name,
        nameAr: e.nameAr,
        descEn: e.description,
        descAr: e.descriptionAr
    )).toList();
  }

  initThirdCatPageData(PropertyModel model){
    thirdCatScreenData.price.text=model.price.toString();
    thirdCatScreenData.capacity.text=model.capacity.toString();
  }

  initThirdScreen(PropertyModel model){
    thirdPageData.selectedLoc=model.occasions;
    thirdPageData.selectedSub=[model.subCategory];
    thirdPageData.descEn.text=model.description;
    thirdPageData.descAr.text=model.translation.ar.description;
    thirdPageData.termsEn.text=model.termsAndConditions;
    thirdPageData.termsAr.text=model.translation.ar.termsAndConditions;
  }

  initFourthScreen(PropertyModel model){
    fourthPageData.selectedOptions=model.options;
    fourthPageData.lat=model.location[0].toString();
    fourthPageData.lat=model.location[1].toString();
  }



}