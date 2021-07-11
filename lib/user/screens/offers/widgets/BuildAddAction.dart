part of 'OfferWidgetImports.dart';

class BuildAddAction extends StatelessWidget {
  final OffersData offersData;
  final PropertyModel model;

  const BuildAddAction({required this.offersData, required this.model});
  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      btnKey: offersData.btnKey,
      margin: EdgeInsets.all(20),
      title: "اضافة",
      onTap: ()=>offersData.saveOfferData(context,model),
    );
  }
}
