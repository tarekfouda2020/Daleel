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
    var compressed = await compressAndGetFile(images);
    normalImagesCubit.state.data.addAll(compressed);
    normalImagesCubit.onUpdateData(normalImagesCubit.state.data);
  }

  removeImage(File file){
    normalImagesCubit.state.data.remove(file);
    normalImagesCubit.onUpdateData(normalImagesCubit.state.data);
  }

  getPanoramaImages()async{
    var images = await Utils.getImages();
    var compressed = await compressAndGetFile(images);
    panoramaImagesCubit.state.data.addAll(compressed);
    panoramaImagesCubit.onUpdateData(panoramaImagesCubit.state.data);
  }

  removePanoramaImage(File file){
    panoramaImagesCubit.state.data.remove(file);
    panoramaImagesCubit.onUpdateData(panoramaImagesCubit.state.data);
  }

  Future<List<File>> compressAndGetFile(List<File> images) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    List<File> results = [];
    for(int i =0; i<images.length;i++){
      File? result = await FlutterImageCompress.compressAndGetFile(
          images[i].absolute.path, "$dir/${DateTime.now().toIso8601String()}.jpg",
          quality: 50,
          rotate: 360,
          autoCorrectionAngle: true
      );
      if(result!=null) results.add(result);
    }
    return results;
  }


  setActivityData(AddActivityData activityData,BuildContext context){
    if (formKey.currentState!.validate()) {
      if (normalImagesCubit.state.data.length<5) {
        LoadingDialog.showSimpleToast("من فضلك ادخل علي الاقل 5 صور");
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