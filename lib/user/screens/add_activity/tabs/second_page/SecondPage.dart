part of 'SecondPageImports.dart';

class SecondPage extends StatefulWidget {
  final AddActivityData addActivityData;
  const SecondPage({required this.addActivityData});
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>{
  
  final SecondPageData pageData =new SecondPageData();
  
  @override
  Widget build(BuildContext context) {
    switch(widget.addActivityData.activityModel.categoryModel!.type){
      case CategoriesTypes.secondCat:
        return SecondCatScreen(activityData: widget.addActivityData);
      case CategoriesTypes.thirdCat:
        return Container();
      default :
        return FirstCatScreen(addActivityData: widget.addActivityData);
    }
  }
}

