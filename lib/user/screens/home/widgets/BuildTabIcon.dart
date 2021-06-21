part of 'HomeWidgetsImports.dart';

class BuildTabIcon extends StatelessWidget {

  final int index;
  final bool active;
  final HomeData homeData;
  BuildTabIcon({required this.index,required this.active,required this.homeData});

  @override
  Widget build(BuildContext context) {
    Color color = active ? MyColors.primary : Colors.black54;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(
            AssetImage(homeData.tabs[index].iconData),
            color: color,
            size: 25,
          ),
          MyText(
            title: homeData.tabs[index].title,
            size: 10,
            color: color,
          )
        ],
      ),
    );
  }
}

