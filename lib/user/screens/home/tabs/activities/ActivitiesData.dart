part of 'ActivitiesImports.dart';

class ActivitiesData{
  final PagingController<int, PropertyModel> pagingController =
  PagingController(firstPageKey: 0);
  final int pageSize = 10;

  Future<void> fetchPage(int pageKey, BuildContext context, {bool refresh = true}) async {
    List<PropertyModel> _products = await UserRepository(context)
        .getAllProperties(pageKey, refresh);
    if (pageKey == 0) {
      pagingController.itemList = [];
    }
    final isLastPage = _products.length < pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(_products);
    } else {
      final nextPageKey = pageKey + 1;
      pagingController.appendPage(_products, nextPageKey);
    }
  }

}