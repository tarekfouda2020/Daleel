part of 'HomeWidgetsImports.dart';


class BuildBottomNavigationBar extends StatelessWidget {
  final int current;
  final HomeData homeData;

  const BuildBottomNavigationBar(
      {required this.current, required this.homeData});

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: 4,
      tabBuilder: (int index, bool isActive) {
        return BuildTabIcon(
          index: index,
          active: isActive,
          homeData: homeData,
        );
      },
      backgroundColor: MyColors.bg,
      splashColor: MyColors.primary,
      activeIndex: current,
      notchAndCornersAnimation: homeData.animation,
      splashSpeedInMilliseconds: 500,
      notchSmoothness: NotchSmoothness.defaultEdge,
      gapLocation: GapLocation.none,
      leftCornerRadius: 0,
      rightCornerRadius: 0,
      elevation: 1,
      height: 65,
      onTap: (index) => homeData.animateTabsPages(index, context),
    );
  }
}
