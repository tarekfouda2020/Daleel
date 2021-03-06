part of 'AddActivityImports.dart';

class AddActivityData{

  final PageController pageController =new PageController();
  AddActivityModel activityModel = new AddActivityModel();

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


  setInitialData(BuildContext context){
    var cat = context.read<CatsCubit>().state.cats.first;
    firstPageData.selectCatCubit.onUpdateData(cat.id);
    getSubCatsAndOptions(cat.id, context);
    thirdPageData.getLocations(context,refresh: false);
    thirdPageData.getLocations(context);
  }

  getSubCatsAndOptions(String catId,BuildContext context){
    fourthPageData.getOptions(context, catId,refresh: false);
    fourthPageData.getOptions(context, catId);
    thirdPageData.getSubCats(context, catId,refresh: false);
    thirdPageData.getSubCats(context, catId);
  }


}