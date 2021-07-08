part of 'FirstPageWidgetImports.dart';

class BuildNormalImages extends StatelessWidget {
  final FirstPageData pageData;

  const BuildNormalImages({required this.pageData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
      child: BlocBuilder<GenericBloc<List<File>>, GenericState<List<File>>>(
        bloc: pageData.normalImagesCubit,
        builder: (context, state) {
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(state.data.length, (index) {
              return Container(
                padding: EdgeInsets.all(5),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(state.data[index]),
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(color: MyColors.greyWhite),
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.topLeft,
                child: Container(
                  width: 25,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle
                  ),
                  child: Icon(Icons.close,size: 12,color: MyColors.white,),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
