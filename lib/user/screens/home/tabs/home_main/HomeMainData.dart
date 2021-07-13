part of 'HomeMainImports.dart';

class HomeMainData {
  GenericBloc<FilterModel?> filterCubit = new GenericBloc(null);

  final PagingController<int, OrderModel> pagingController =
      PagingController(firstPageKey: 0);
  final int pageSize = 10;
  FilterModel? numFilter;

  List<FilterModel> allFilters = [
    FilterModel(
        key: "property_name",
        name: "activityName",
        value: TextEditingController()),
    FilterModel(
        key: "customer_mobile",
        name: "customerPhone",
        value: TextEditingController()),
    FilterModel(
        key: "customer_name",
        name: "customerName",
        value: TextEditingController()),
    FilterModel(
        key: "to",
        key2: "form",
        name: "Date",
        value: TextEditingController(),
        value2: TextEditingController()),
    FilterModel(
        key: "transaction", name: "price", value: TextEditingController()),
  ];

  Future<void> fetchPage(int pageKey, BuildContext context,
      {bool refresh = true}) async {
    List<OrderModel> _orders = await UserRepository(context)
        .getOrders(pageKey, filterCubit.state.data ?? numFilter, refresh);
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

  showFilterDialog(BuildContext context, HomeMainData homeMainData) {
    filterCubit.onUpdateData(null);
    allFilters.forEach((element) {
      element.value.text="";
      element.value2?.text="";
    });
    showModal(
      context: context,
      configuration: FadeScaleTransitionConfiguration(),
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: BuildSearchForm(homeMainData: homeMainData),
        );
      },
    );
  }

  filterOrderByFilter(BuildContext context) {
    if (filterCubit.state.data == null) {
      LoadingDialog.showSimpleToast(tr(context, "searchType"));
      return;
    }
    if (filterCubit.state.data!.value.text.isEmpty) {
      LoadingDialog.showSimpleToast(tr(context, "searchValue"));
      return;
    }
    Navigator.of(context).pop();
    pagingController.refresh();
  }

  onNumberSearch(String value, BuildContext context) {
    if (value.trim().isEmpty) {
      numFilter = null;
      pagingController.refresh();
      return;
    }
    filterCubit.onUpdateData(null);
    numFilter = FilterModel(
        key: "booking_number",
        name: "",
        value: TextEditingController(text: value));
    pagingController.refresh();
  }

  num calculateDeposit(PropertyOrderModel model) {
    num percent = model.category.downPaymentPercentage / 100;
    if (model.offerPrice == 0) {
      return model.price * percent;
    }
    return model.offerPrice * percent;
  }

  num calculateRestPrice(PropertyOrderModel model) {
    return model.price - calculateDeposit(model);
  }

  setToDate(BuildContext context) {
    AdaptivePicker.datePicker(
      context: context,
      title: tr(context, "selectDate"),
      minDate: DateTime(2000),
      onConfirm: (date){
        if (date!=null) {
          filterCubit.state.data!.value2!.text=DateFormat("dd-MM-yyy").format(date);
          filterCubit.onUpdateData(filterCubit.state.data);
        }
      },
    );
  }

  setFromDate(BuildContext context) {
    AdaptivePicker.datePicker(
      context: context,
      title: tr(context, "selectDate"),
      minDate: DateTime(2000),
      onConfirm: (date){
        if (date!=null) {
          filterCubit.state.data!.value.text=DateFormat("dd-MM-yyy").format(date);
          filterCubit.onUpdateData(filterCubit.state.data);
        }
      },
    );
  }



}
