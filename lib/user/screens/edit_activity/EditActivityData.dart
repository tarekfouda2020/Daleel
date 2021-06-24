part of 'EditActivityImports.dart';

class EditActivityData{
  final PageController pageController =new PageController();

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