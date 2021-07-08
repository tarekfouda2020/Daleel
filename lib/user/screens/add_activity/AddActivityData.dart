part of 'AddActivityImports.dart';

class AddActivityData{

  final PageController pageController =new PageController();
  AddActivityModel activityModel = new AddActivityModel();

  final GenericBloc<int> stepperCubit = new GenericBloc(0);

  goToNextPage(){
    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    stepperCubit.onUpdateData(stepperCubit.state.data+1);
  }
  goToPreviousPage(){
    pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    stepperCubit.onUpdateData(stepperCubit.state.data-1);
  }

}