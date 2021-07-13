part of 'FirstPageWidgetImports.dart';

class BuildPanoramaImages extends StatelessWidget {
  final FirstPageData pageData;

  const BuildPanoramaImages({required this.pageData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
      child: BlocBuilder<GenericBloc<EditActivityImgModel>, GenericState<EditActivityImgModel>>(
        bloc: pageData.panoramaImagesCubit,
        builder: (context, state) {
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ...state.data.exist.map((e) {
                return CachedImage(
                  url: e,
                  height: 100,
                  width: 100,
                  borderColor: MyColors.greyWhite,
                  borderRadius: BorderRadius.circular(5),
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: ()=> pageData.removePanoramaExistImage(e),
                    child: Container(
                      width: 25,
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black26, shape: BoxShape.circle),
                      child: Icon(
                        Icons.close,
                        size: 12,
                        color: MyColors.white,
                      ),
                    ),
                  ),
                );
              }).toList(),
              ...state.data.images.map((e) {
                return Container(
                  padding: EdgeInsets.all(5),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(e),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(color: MyColors.greyWhite),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: ()=> pageData.removePanoramaImage(e),
                    child: Container(
                      width: 25,
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black26, shape: BoxShape.circle),
                      child: Icon(
                        Icons.close,
                        size: 12,
                        color: MyColors.white,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}
