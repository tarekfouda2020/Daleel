part of 'FourthPageImports.dart';

class FourthPageData{
  final GlobalKey<FormState> formKey = new GlobalKey();

  final Completer<GoogleMapController> controller = Completer();
  TextEditingController location = new TextEditingController();
  final LocationCubit locCubit = new LocationCubit();
  final GenericBloc<List<AddOptionModel>> optionsCubit = new GenericBloc([]);
  final GenericBloc<List<AddOptionModel>> currentCubit = new GenericBloc([]);

  List<AddOptionModel> allOptions = [];
  List<AddOptionModel> selectedOptions = [];

  String? lat;
  String? lng;


  getOptions(BuildContext context, String catId, {bool refresh = true})async{
    allOptions = await UserRepository(context).getOptions(catId, refresh);
    optionsCubit.onUpdateData(allOptions);
  }

  void onSelectOptions(List<AddOptionModel> options){
    selectedOptions = options;
    currentCubit.onUpdateData(options);
  }

  void onOptionClick(AddOptionModel option){
    selectedOptions.remove(option);
    optionsCubit.onUpdateData(allOptions);
  }

  saveDataToModel(BuildContext context, AddActivityData addActivityData)async{
    if (formKey.currentState!.validate()) {
      addActivityData.activityModel.location=[double.parse(lat??"0"),double.parse(lng??"0")];
      addActivityData.activityModel.options=selectedOptions;
      addActivityData.activityModel.address=location.text;
      print(addActivityData.activityModel.toJson());
      var result = await UserRepository(context).addActivity(addActivityData.activityModel);
      if(result){
        LoadingDialog.showToastNotification(tr(context, "activityAddSuccessfully"));
        Navigator.of(context).pop(true);
      }
    }
  }

}