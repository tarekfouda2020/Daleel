part of 'OfferWidgetImports.dart';

class BuildHeaderColor extends StatelessWidget {
  final PropertyModel model;

  const BuildHeaderColor({required this.model});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      decoration: BoxDecoration(
        color: model.propertyStatus==PropertyStatus.verified? MyColors.secondary : MyColors.redColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8)
        )
      ),
    );
  }
}

