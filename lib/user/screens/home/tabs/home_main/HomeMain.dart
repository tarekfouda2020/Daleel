part of 'HomeMainImports.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final HomeMainData homeMainData = new HomeMainData();

  @override
  void initState() {
    homeMainData.fetchPage(0, context, refresh: false);
    homeMainData.pagingController.addPageRequestListener((pageKey) {
      homeMainData.fetchPage(pageKey, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: DefaultAppBar(title: "الحجوزات", back: false),
        preferredSize: Size.fromHeight(60),
      ),
      body: GestureDetector(
        onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(
          children: [
            BuildFilterView(homeMainData: homeMainData),
            Flexible(
              child: CupertinoScrollbar(
                child: PagedListView<int, OrderModel>(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  pagingController: homeMainData.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<OrderModel>(
                      firstPageProgressIndicatorBuilder: (context) =>
                          LoadingDialog.showLoadingView(),
                      noItemsFoundIndicatorBuilder: (context) => BuildNoItemFound(
                            title: "لا يوجد طلبات",
                            message: "انتظر الحصول علي طلبات قريبا",
                          ),
                      itemBuilder: (context, item, index) {
                        return BuildOrderItem(
                          model: item,
                          mainData: homeMainData,
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
