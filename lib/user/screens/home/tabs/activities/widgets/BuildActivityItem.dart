part of 'ActivitiesWidgetImports.dart';

class BuildActivityItem extends StatelessWidget {
  final PropertyModel model;
  final ActivitiesData activityData;

  const BuildActivityItem({required this.model, required this.activityData});
  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode=="ar";
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: MyColors.greyWhite),
          borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            height: 15,
            decoration: BoxDecoration(
                color: model.propertyStatus==PropertyStatus.verified? MyColors.secondary : MyColors.redColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      title: lang? model.translation.ar.name:model.name,
                      color: MyColors.blackOpacity,
                      size: 10,
                      fontWeight: FontWeight.w700,
                    ),
                    Offstage(
                      offstage: CategoryModel.getTypeValue(model.category.tag)!=CategoriesTypes.firstCat,
                      child: MyText(
                        title: "${tr(context,"depts")} : ${(model.firstSectionPrice!=null?1:0)+(model.secondSectionPrice!=null?1:0)}",
                        color: MyColors.blackOpacity,
                        size: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                MyText(
                  title: lang? model.category.translation.ar.name : model.category.name,
                  color: MyColors.blackOpacity,
                  size: 10,
                  fontWeight: FontWeight.w500,
                ),
                MyText(
                  title: model.city.name,
                  color: MyColors.blackOpacity,
                  size: 10,
                  fontWeight: FontWeight.w500,
                ),
                MyText(
                  title: "${activityData.calculatePrice(model)} ${tr(context,"sar")}",
                  color: MyColors.blackOpacity,
                  size: 10,
                  fontWeight: FontWeight.w500,
                ),
                Container(
                  margin: EdgeInsets.only(top: 5,right: 5,left: 5),
                  child: Row(
                    children: [
                      BuildEditAction(activitiesData: activityData,model: model),
                      SizedBox(width: 20),
                      BuildActivityAction(
                        title: tr(context,"offer"),
                        onTap: ()=> AutoRouter.of(context).push(OffersRoute(model: model)),
                        iconData: Icons.add,
                      ),
                      Spacer(),
                      BuildActivityAction(
                        title: model.propertyStatus==PropertyStatus.verified? tr(context,"active") : tr(context,"unActive"),
                        color: model.propertyStatus==PropertyStatus.verified? MyColors.secondary : MyColors.redColor,
                        onTap: (){},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
