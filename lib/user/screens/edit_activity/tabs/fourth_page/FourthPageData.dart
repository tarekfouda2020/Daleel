part of 'FourthPageImports.dart';

class FourthPageData{
  final GlobalKey<FormState> formKey = new GlobalKey();

  final Completer<GoogleMapController> controller = Completer();
  TextEditingController location = new TextEditingController();
  GenericBloc<List<CityModel>> optionsCubit = new GenericBloc([]);
  final LocationCubit locCubit = new LocationCubit();

  List<CityModel> allOptions = [];
  List<CityModel> selectedOptions = [];

  String? lat;
  String? lng;


  getOptions(BuildContext context, String catId, {bool refresh = true})async{
    allOptions= await UserRepository(context).getOptions(catId, refresh);
    optionsCubit.onUpdateData(allOptions);
    var filters = allOptions.where((e) => selectedOptions.where((x) => e.id==x.id).length>0).toList();
    onSelectOptions(filters);
  }

  void onSelectOptions(List<CityModel> options){
    selectedOptions = options;
  }

  void onOptionClick(CityModel option){
    selectedOptions.remove(option);
    optionsCubit.onUpdateData(allOptions);
  }

  saveDataToModel(BuildContext context, EditActivityData addActivityData)async{
    if (formKey.currentState!.validate()) {
      addActivityData.activityModel.location=[double.parse(lat??"0"),double.parse(lng??"0")];
      addActivityData.activityModel.options=selectedOptions;
      var result = await UserRepository(context).editActivity(addActivityData.activityModel);
      if(result){
        AutoRouter.of(context).pop();
      }
    }
  }

}