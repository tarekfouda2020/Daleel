part of 'ThirdCatScreenImports.dart';

class ThirdCatScreen extends StatefulWidget {
  final AddActivityData addActivityData;

  const ThirdCatScreen({required this.addActivityData});
  @override
  _ThirdCatScreenState createState() => _ThirdCatScreenState();
}

class _ThirdCatScreenState extends State<ThirdCatScreen>{

  late ThirdCatScreenData screenData;


  @override
  void initState() {
    screenData= widget.addActivityData.thirdCatScreenData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: MyColors.greyWhite)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildHeaderColor(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MyText(title: tr(context, "priceAndCapacity"), color: MyColors.primary, size: 16,fontWeight: FontWeight.w500,),
                ),
                BuildFormView(pageData: screenData),
              ],
            ),
          ),

          BuildActionsView(addActivityData: widget.addActivityData)
        ],
      ),
    );
  }
}

