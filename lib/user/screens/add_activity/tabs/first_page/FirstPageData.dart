part of 'FirstPageImports.dart';

class FirstPageData{

  final GlobalKey<FormState> formKey = new GlobalKey();
  final GenericBloc<String> selectCatCubit = new GenericBloc("");
  final GenericBloc<List<File>> normalImagesCubit = new GenericBloc([]);
  final GenericBloc<List<File>> panoramaImagesCubit = new GenericBloc([]);

  final TextEditingController nameAr = new TextEditingController();
  final TextEditingController nameEn = new TextEditingController();

  CityModel? cityModel;

  onCityChange(CityModel? model){
    cityModel = model;
  }

  onSelectCatChanged(AddActivityData activityData,BuildContext context,String catId){
    activityData.getSubCatsAndOptions(catId, context);
    selectCatCubit.onUpdateData(catId);
  }

  getNormalImages()async{
    var images = await Utils.getImages();
    normalImagesCubit.state.data.addAll(images);
    normalImagesCubit.onUpdateData(normalImagesCubit.state.data);
  }

  removeImage(File file){
    normalImagesCubit.state.data.remove(file);
    normalImagesCubit.onUpdateData(normalImagesCubit.state.data);
  }

  getPanoramaImages()async{
    var images = await Utils.getImages();
    panoramaImagesCubit.state.data.addAll(images);
    panoramaImagesCubit.onUpdateData(panoramaImagesCubit.state.data);
  }

  removePanoramaImage(File file){
    panoramaImagesCubit.state.data.remove(file);
    panoramaImagesCubit.onUpdateData(panoramaImagesCubit.state.data);
  }

  setActivityData(AddActivityData activityData,BuildContext context){
    if (formKey.currentState!.validate()) {
      if (normalImagesCubit.state.data.length>5||normalImagesCubit.state.data.length<2) {
        LoadingDialog.showSimpleToast(tr(context, "enter2To5Images"));
        return;
      }
      var selected = context.read<CatsCubit>().state.cats
          .where((e) => e.id==selectCatCubit.state.data).first;
      activityData.activityModel.categoryModel=selected;
      activityData.activityModel.nameAr=nameAr.text;
      activityData.activityModel.nameEn=nameEn.text;
      activityData.activityModel.city=cityModel?.id;
      activityData.activityModel.images=normalImagesCubit.state.data;
      activityData.activityModel.panoramicImages=panoramaImagesCubit.state.data;

      activityData.goToNextPage();
    }
  }

}