part of 'OfferWidgetImports.dart';

class BuildAddAction extends StatelessWidget {
  final OffersData offersData;

  const BuildAddAction({required this.offersData});
  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      btnKey: offersData.btnKey,
      margin: EdgeInsets.all(20),
      title: "اضافة",
      onTap: (){},
    );
  }
}
