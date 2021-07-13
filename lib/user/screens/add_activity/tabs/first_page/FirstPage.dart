part of 'FirstPageImports.dart';

class FirstPage extends StatefulWidget {
  final AddActivityData addActivityData;

  const FirstPage({required this.addActivityData});
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

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
                  BuildTypesView(activityData: widget.addActivityData),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MyText(title: tr(context, "baseInfo"), color: MyColors.primary, size: 16,fontWeight: FontWeight.w500,),
                  ),
                  BuildImagesView(
                    onTap: () => widget.addActivityData.firstPageData.getNormalImages(),
                    title: tr(context, "uploadImages"),
                    subtitle: tr(context, "from2To5"),
                  ),
                  BuildNormalImages(pageData: widget.addActivityData.firstPageData,),
                  BuildImagesView(
                    onTap: () => widget.addActivityData.firstPageData.getPanoramaImages(),
                    title: tr(context, "360Degree"),
                  ),
                  BuildPanoramaImages(pageData: widget.addActivityData.firstPageData,),
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
