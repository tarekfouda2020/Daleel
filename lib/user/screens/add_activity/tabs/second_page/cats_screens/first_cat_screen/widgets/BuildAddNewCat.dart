part of 'SecondPageWidgetsImports.dart';

class BuildAddNewCat extends StatelessWidget {
  final int state;
  final FirstCatScreenData screenData;

  const BuildAddNewCat({required this.state, required this.screenData});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: state<2,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(title: "اضافة قسم جديد", color: MyColors.black, size: 14),
            IconButton(
              onPressed: ()=> screenData.setAddDept(),
              icon: Icon(Icons.add_box_rounded,size: 25,color: MyColors.secondary,),
            ),
          ],
        ),
      ),
    );
  }
}
