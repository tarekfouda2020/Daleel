part of 'FirstPageImports.dart';

class FirstPage extends StatefulWidget {
  final AddActivityData addActivityData;

  const FirstPage({required this.addActivityData});
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  void initState() {
    var cat = context.read<CatsCubit>().state.cats.first;
    widget.addActivityData.firstPageData.selectCatCubit.onUpdateData(cat.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: MyColors.greyWhite)
        ),
        child: Column(
          children: [
            Flexible(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  BuildHeaderColor(),
                  BuildTypesView(pageData: widget.addActivityData.firstPageData),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MyText(title: "المعلومات الاساسية", color: MyColors.primary, size: 16,fontWeight: FontWeight.w500,),
                  ),
                  BuildImagesView(
                    onTap: () => widget.addActivityData.firstPageData.getNormalImages(),
                    title: "رفع الصور",
                    subtitle: "من ٢ الي ٥ صور",
                  ),
                  BuildNormalImages(pageData: widget.addActivityData.firstPageData,),
                  BuildImagesView(
                    onTap: (){},
                    title: "رفع صور ٣٦٠ درجة",
                  ),
                  BuildFormView(pageData: widget.addActivityData.firstPageData),
                ],
              ),
            ),
            BuildActionView(
              pageData: widget.addActivityData.firstPageData,
              addActivityData: widget.addActivityData,
            ),
          ],
        ),
      ),
    );
  }
}
