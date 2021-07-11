part of 'OfferWidgetImports.dart';

class BuildAddCard extends StatelessWidget {
  final OffersData offersData;
  final PropertyModel model;

  const BuildAddCard({required this.offersData, required this.model});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: MyColors.greyWhite)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildHeaderColor(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: MyText(title: "اسم النشاط", color: MyColors.primary, size: 16,fontWeight: FontWeight.w500,),
          ),
          BuildFormView(offersData: offersData, model: model,),
        ],
      ),
    );
  }
}

