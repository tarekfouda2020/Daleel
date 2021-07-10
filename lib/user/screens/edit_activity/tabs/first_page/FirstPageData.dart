part of 'FirstPageImports.dart';

class FirstPageData{

  final GlobalKey<FormState> formKey = new GlobalKey();
  final GenericBloc<String> selectCatCubit = new GenericBloc("");
  final GenericBloc<EditActivityImgModel> normalImagesCubit =
  new GenericBloc(EditActivityImgModel(images: [],exist: []));

  final TextEditingController nameAr = new TextEditingController();
  final TextEditingController nameEn = new TextEditingController();

  CityModel? cityModel;

  onCityChange(CityModel? model){
    cityModel = model;
  }

  onSelectCatChanged(EditActivityData activityData,BuildContext context,String catId){
    activityData.getSubCatsAndOptions(catId, context);
    selectCatCubit.onUpdateData(catId);
  }

  getNormalImages()async{
    var images = await Utils.getImages();
    normalImagesCubit.state.data.images.addAll(images);
    normalImagesCubit.onUpdateData(normalImagesCubit.state.data);
  }

  removeImage(File file){
    normalImagesCubit.state.data.images.remove(file);
    normalImagesCubit.onUpdateData(normalImagesCubit.state.data);
  }
  removeExistImage(String image){
    normalImagesCubit.state.data.exist.remove(image);
    normalImagesCubit.onUpdateData(normalImagesCubit.state.data);
  }

  setActivityData(EditActivityData activityData,BuildContext context){
    if (formKey.currentState!.validate()) {
      int len = normalImagesCubit.state.data.images.length+normalImagesCubit.state.data.exist.length;
      if (len>5||len<2) {
        LoadingDialog.showSimpleToast("ادخل من من ٢ الي ه صور");
        return;
      }
      var selected = context.read<CatsCubit>().state.cats
          .where((e) => e.id==selectCatCubit.state.data).first;
      activityData.activityModel.categoryModel=selected;
      activityData.activityModel.nameAr=nameAr.text;
      activityData.activityModel.nameEn=nameEn.text;
      activityData.activityModel.city=cityModel?.id;
      activityData.activityModel.images=normalImagesCubit.state.data.images;
      activityData.activityModel.exist=normalImagesCubit.state.data.exist;

      activityData.goToNextPage();
    }
  }

}