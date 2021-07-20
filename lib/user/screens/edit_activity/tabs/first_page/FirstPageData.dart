part of 'FirstPageImports.dart';

class FirstPageData{

  final GlobalKey<FormState> formKey = new GlobalKey();
  final GenericBloc<String> selectCatCubit = new GenericBloc("");
  final GenericBloc<EditActivityImgModel> normalImagesCubit =
  new GenericBloc(EditActivityImgModel(images: [],exist: []));
  final GenericBloc<EditActivityImgModel> panoramaImagesCubit =
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
    var compressed = await compressAndGetFile(images);
    normalImagesCubit.state.data.images.addAll(compressed);
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

  getPanoramaImages()async{
    var images = await Utils.getImages();
    var compressed = await compressAndGetFile(images);
    panoramaImagesCubit.state.data.images.addAll(compressed);
    panoramaImagesCubit.onUpdateData(panoramaImagesCubit.state.data);
  }

  removePanoramaImage(File file){
    panoramaImagesCubit.state.data.images.remove(file);
    panoramaImagesCubit.onUpdateData(panoramaImagesCubit.state.data);
  }
  removePanoramaExistImage(String image){
    panoramaImagesCubit.state.data.exist.remove(image);
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


  setActivityData(EditActivityData activityData,BuildContext context){
    if (formKey.currentState!.validate()) {
      int len = normalImagesCubit.state.data.images.length+normalImagesCubit.state.data.exist.length;
      if (len<5) {
        LoadingDialog.showSimpleToast("من فضلك ادخل علي الاقل 5 صور");
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
      activityData.activityModel.panoramicImages=panoramaImagesCubit.state.data.images;
      activityData.activityModel.existPanoramic=panoramaImagesCubit.state.data.exist;

      activityData.goToNextPage();
    }
  }

}