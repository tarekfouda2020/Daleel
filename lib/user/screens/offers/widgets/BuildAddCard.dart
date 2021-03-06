part of 'OfferWidgetImports.dart';

class BuildAddCard extends StatelessWidget {
  final OffersData offersData;
  final PropertyModel model;

  const BuildAddCard({required this.offersData, required this.model});

  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode=="ar";
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: MyColors.greyWhite)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildHeaderColor(model: model),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: lang? model.translation.ar.name:model.name,
                  color: MyColors.primary,
                  size: 16,
                  fontWeight: FontWeight.w500,
                ),
                MyText(
                  title: model.propertyStatus==PropertyStatus.verified?
                  tr(context, "active") : tr(context, "unActive"),
                  color: model.propertyStatus==PropertyStatus.verified? MyColors.secondary : MyColors.redColor,
                  size: 16,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          BuildFormView(
            offersData: offersData,
            model: model,
          ),
        ],
      ),
    );
  }
}
