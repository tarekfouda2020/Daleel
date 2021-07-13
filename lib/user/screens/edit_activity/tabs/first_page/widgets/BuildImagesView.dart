part of 'FirstPageWidgetImports.dart';

class BuildImagesView extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Function() onTap;

  const BuildImagesView(
      {required this.title, required this.onTap, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              MyText(
                title: title,
                color: MyColors.black,
                size: 10,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(width: 10),
              Offstage(
                offstage: subtitle==null,
                child: MyText(
                  title: subtitle??"",
                  color: MyColors.blackOpacity,
                  size: 8,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 45,
              width: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: MyColors.blackOpacity)),
              child: MyText(title: tr(context, "uploadImages"), color: MyColors.black, size: 12),
            ),
          )
        ],
      ),
    );
  }
}
