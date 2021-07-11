part of 'ActivitiesImports.dart';

class Activities extends StatefulWidget {
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  ActivitiesData activitiesData = new ActivitiesData();

  @override
  void initState() {
    activitiesData.fetchPage(0, context, refresh: false);
    activitiesData.pagingController.addPageRequestListener((pageKey) {
      activitiesData.fetchPage(pageKey, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: DefaultAppBar(
          title: "الانشطة",
          back: false,
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: CupertinoScrollbar(
        child: RefreshIndicator(
          onRefresh: () async => activitiesData.fetchPage(0, context),
          child: PagedListView<int, PropertyModel>(
            padding: EdgeInsets.only(right: 15, left: 15, bottom: 50),
            pagingController: activitiesData.pagingController,
            builderDelegate: PagedChildBuilderDelegate<PropertyModel>(
                firstPageProgressIndicatorBuilder: (context) => LoadingDialog.showLoadingView(),
                noItemsFoundIndicatorBuilder: (context) => BuildNoItemFound(
                      title: "لا يوجد انشطة",
                      message: "اضف نشطاتك للحصول علي طلبات",
                    ),
                itemBuilder: (context, item, index) {
                  return BuildActivityItem(
                    model: item,
                    activityData: activitiesData,
                  );
                }),
          ),
        ),
      ),
      floatingActionButton: BuildFloatAction(activitiesData: activitiesData),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
