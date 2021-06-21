part of 'HomeImports.dart';

class Home extends StatefulWidget {
  final int tab;

  const Home({this.tab = 0});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final HomeData homeData = new HomeData();

  @override
  void initState() {
    homeData.initBottomNavigation(this, context);
    homeData.animateTabsPages(widget.tab, context,);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: DefaultTabController(
        length: 5,
        initialIndex: 4,
        child: Scaffold(
          key: homeData.scaffold,
          body: BlocBuilder<GenericBloc<int>, GenericState<int>>(
            bloc: homeData.homeTabCubit,
            builder: (context, state) {
              return PageTransitionSwitcher(
                duration: Duration(milliseconds: 800),
                transitionBuilder:
                    (child, primaryAnimation, secondaryAnimation) {
                  return FadeThroughTransition(
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                child: homeData.tabsView[state.data],
              );
            },
          ),
          bottomNavigationBar: BlocBuilder<GenericBloc<int>, GenericState<int>>(
            bloc: homeData.homeTabCubit,
            builder: (context, state) {
              return BuildBottomNavigationBar(
                current: state.data,
                homeData: homeData,
              );
            },
          ),
        ),
      ),
      onWillPop: homeData.onBackPressed,
    );
  }

  @override
  void dispose() {
    homeData.tabController.dispose();
    homeData.animationController.dispose();
    super.dispose();
  }
}
