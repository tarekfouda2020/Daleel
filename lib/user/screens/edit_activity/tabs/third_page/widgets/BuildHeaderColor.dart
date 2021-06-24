part of 'ThirdPageWidgetsImports.dart';

class BuildHeaderColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      decoration: BoxDecoration(
        color: MyColors.secondary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8)
        )
      ),
    );
  }
}

