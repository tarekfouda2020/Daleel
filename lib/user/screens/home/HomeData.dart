part of 'HomeImports.dart';


class HomeData {

  final GlobalKey<ScaffoldState> scaffold = new GlobalKey();

  final GenericBloc<int> homeTabCubit =new GenericBloc(1);


  late AnimationController animationController;
  late TabController tabController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  List<Widget> tabsView=[
    HomeMain(),
    Activities(),
    Information(),
    Settings(),
  ];

  List<BottomTabModel> tabs = [
    BottomTabModel(iconData: Res.reservation, title: "الحجوزات"),
    BottomTabModel(iconData: Res.home, title: "الانشطة"),
    BottomTabModel(iconData: Res.profile, title: "البيانات"),
    BottomTabModel(iconData: Res.more, title: "المزيد"),
  ];

  void initBottomNavigation(TickerProvider ticker,BuildContext context) {
    tabController = new TabController(length: 4, vsync: ticker,initialIndex: 0);
    animationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: ticker,
    );
    curve = CurvedAnimation(
      parent: animationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(milliseconds: 600),
      () => animationController.forward(),
    );
  }

  void animateTabsPages(int index, BuildContext context) {
    if (index != homeTabCubit.state.data) {
      homeTabCubit.onUpdateData(index);
      tabController.animateTo(index);
    }
  }

  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }
}
