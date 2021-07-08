part of 'PackagesWidgetImports.dart';

class BuildTypesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: BuildTypeAction(
              selected: false,
              onTap: () {},
              title: "السعر بالفرد",
            ),
          ),
          Expanded(
            child: BuildTypeAction(
              selected: true,
              onTap: () {},
              title: "السعر بالبكدج",
            ),
          ),
        ],
      ),
    );
  }
}
