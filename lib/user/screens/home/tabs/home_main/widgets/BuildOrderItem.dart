part of 'HomeMainWidgetsImports.dart';

class BuildOrderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimationContainer(
      scale: true,
      child: Container(
        padding: EdgeInsets.only(right: 10),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: MyColors.grey, width: .5),
            color: MyColors.secondary),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
            color: MyColors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      title: "D26L2# - فراس مصطفى",
                      color: MyColors.grey,
                      size: 10,
                      fontWeight: FontWeight.w600,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: MyText(
                        title: "استراحة الشاذلية (قسم النساء)",
                        color: MyColors.grey,
                        size: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    MyText(
                      title: "السبت - 6 فبراير - 2020",
                      color: MyColors.grey,
                      size: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  MyText(
                    title: "العربون  200",
                    color: MyColors.grey,
                    size: 10,
                    fontWeight: FontWeight.w600,
                  ),
                  MyText(
                    title: "المتبقي  200",
                    color: MyColors.grey,
                    size: 10,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: 80,
                    child: Divider(color: MyColors.grey,height: 5,),
                  ),
                  MyText(
                    title: "السعر   500",
                    color: MyColors.secondary,
                    size: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
