part of 'HomeMainWidgetsImports.dart';

class BuildOrderItem extends StatelessWidget {
  final OrderModel model;
  final HomeMainData mainData;

  const BuildOrderItem({required this.model, required this.mainData});

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
            color: model.currentStatus=="paid"? MyColors.secondary : MyColors.redColor,
        ),
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
                      title: "${model.bookingNumber}# -${model.user.name}",
                      color: MyColors.grey,
                      size: 10,
                      fontWeight: FontWeight.w600,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: MyText(
                        title: "${model.property.name} (${model.property.category.name})",
                        color: MyColors.grey,
                        size: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    MyText(
                      title: DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY,'ar').format(model.date),
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
                    title: "${tr(context,"rent")}  ${mainData.calculateDeposit(model.property)}",
                    color: model.currentStatus=="paid"? MyColors.grey : MyColors.redColor,
                    size: 10,
                    fontWeight: FontWeight.w600,
                  ),
                  MyText(
                    title: "${tr(context,"rest")}  ${mainData.calculateRestPrice(model.property)}",
                    color: MyColors.grey,
                    size: 10,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: 80,
                    child: Divider(color: MyColors.grey,height: 5,),
                  ),
                  MyText(
                    title: "${tr(context, "price")}   ${model.property.price}",
                    color: model.currentStatus=="paid"? MyColors.grey : MyColors.secondary,
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
