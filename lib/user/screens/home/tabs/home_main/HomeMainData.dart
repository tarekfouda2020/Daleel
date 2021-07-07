part of 'HomeMainImports.dart';

class HomeMainData {

  GenericBloc<DropdownModel?> filterCubit = new GenericBloc(null);

  TextEditingController activity = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController price = TextEditingController();

  final PagingController<int, OrderModel> pagingController =
  PagingController(firstPageKey: 0);
  final int pageSize = 10;

  Future<void> fetchPage(int pageKey, BuildContext context, {bool refresh = true}) async {
    List<OrderModel> _orders = await UserRepository(context)
        .getOrders(pageKey, refresh);
    if (pageKey == 0) {
      pagingController.itemList = [];
    }
    final isLastPage = _orders.length < pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(_orders);
    } else {
      final nextPageKey = pageKey + 1;
      pagingController.appendPage(_orders, nextPageKey);
    }
  }

  List<DropdownModel> data = [
    DropdownModel(id: 1,name: "اسم النشاط"),
    DropdownModel(id: 2,name: "جوال العميل"),
    DropdownModel(id: 3,name: "اسم العميل"),
    DropdownModel(id: 4,name: "التاريخ"),
    DropdownModel(id: 5,name: "السعر"),
  ];

  showFilterDialog(BuildContext context,HomeMainData homeMainData) {
    showModal(
      context: context,
      configuration: FadeScaleTransitionConfiguration(),
      builder: (_){
        return AlertDialog(
          backgroundColor: Colors.white,
          content: BuildSearchForm(homeMainData: homeMainData),
        );
      },
    );
  }


}
