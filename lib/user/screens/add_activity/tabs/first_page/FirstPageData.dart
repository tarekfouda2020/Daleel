part of 'FirstPageImports.dart';

class FirstPageData{

  final GlobalKey<FormState> formKey = new GlobalKey();
  final GenericBloc<String> selectCatCubit = new GenericBloc("");
  final GenericBloc<List<File>> normalImagesCubit = new GenericBloc([]);

  final TextEditingController nameAr = new TextEditingController();
  final TextEditingController nameEn = new TextEditingController();

  CityModel? cityModel;

  onCityChange(CityModel? model){
    cityModel = model;
  }

  getNormalImages()async{
    var images = await Utils.getImages();
    normalImagesCubit.state.data.addAll(images);
    normalImagesCubit.onUpdateData(normalImagesCubit.state.data);
  }

  setActivityData(AddActivityData activityData,BuildContext context){
    if (formKey.currentState!.validate()) {
      if (normalImagesCubit.state.data.length>5||normalImagesCubit.state.data.length<2) {
        LoadingDialog.showSimpleToast("ادخل من من ٢ الي ه صور");
        return;
      }
      var selected = context.read<CatsCubit>().state.cats
          .where((e) => e.id==selectCatCubit.state.data).first;
      activityData.activityModel.categoryModel=selected;
      activityData.activityModel.nameAr=nameAr.text;
      activityData.activityModel.nameEn=nameEn.text;
      activityData.activityModel.city=cityModel?.id;
      activityData.activityModel.images=normalImagesCubit.state.data;

      activityData.goToNextPage();
    }
  }

}