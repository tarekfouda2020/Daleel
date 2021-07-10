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

  calculatePrice(PropertyModel model){
    CategoriesTypes type = CategoryModel.getTypeValue(model.category.tag);
    if (type==CategoriesTypes.firstCat) {
      return model.allSectionsPrice?.saturdayPrice??0;
    } else if(type==CategoriesTypes.secondCat){
      if (model.packagePrices.length>0) {
        return model.packagePrices.first.packagePrice;
      }else if(model.personPrices.length>0){
        return (model.personPrices.first.pricePerPerson)*(model.personPrices.first.maximumCount);
      }else{
        return model.price;
      }
    }else{
      return model.price;
    }
  }

}