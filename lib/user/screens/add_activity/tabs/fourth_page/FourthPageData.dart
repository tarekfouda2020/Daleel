part of 'FourthPageImports.dart';

class FourthPageData{

  final Completer<GoogleMapController> controller = Completer();

  GenericBloc<List<CityModel>> optionsCubit = new GenericBloc([]);

  List<CityModel> allOptions = [];
  List<CityModel> selectedOptions = [];
  getOptions(BuildContext context, String catId, {bool refresh = true})async{
    allOptions= await UserRepository(context).getOptions(catId, refresh);
    optionsCubit.onUpdateData(allOptions);
  }

  void onSelectOptions(List<CityModel> options){
    selectedOptions = options;
  }

  void onOptionClick(CityModel option){
    selectedOptions.remove(option);
    optionsCubit.onUpdateData(allOptions);
  }


}