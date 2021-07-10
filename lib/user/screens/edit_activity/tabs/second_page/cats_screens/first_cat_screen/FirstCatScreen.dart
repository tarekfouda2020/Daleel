part of 'FirstCatScreenImports.dart';

class FirstCatScreen extends StatefulWidget {
  final EditActivityData addActivityData;

  const FirstCatScreen({required this.addActivityData});

  @override
  _FirstCatScreenState createState() => _FirstCatScreenState();
}

class _FirstCatScreenState extends State<FirstCatScreen> {
  late FirstCatScreenData screenData;


  @override
  void initState() {
    super.initState();
    screenData = widget.addActivityData.firstCatScreenData;
    screenData.allSectionsPrice.allDeptFields[7].value.text=widget.addActivityData.activityModel.nameEn!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Column(
        children: [
          Flexible(
            child: ListView(
              children: [
                MyText(
                  title: "السعر",
                  color: MyColors.primary,
                  size: 16,
                  fontWeight: FontWeight.w600,
                ),
                BuildActivityCard(
                  model: screenData.allSectionsPrice,
                  onSave: (model) =>screenData.setSaveAllPrice(model,1),
                ),
                BuildFirstDeptCard(
                  title: "القسم الاول",
                  model: screenData.firstSectionPrice,
                  onSave: (model) =>screenData.setSaveAllPrice(model,2),
                ),
                BuildFirstDeptCard(
                  title: "القسم الثاني",
                  model: screenData.secondSectionPrice,
                  onSave: (model) =>screenData.setSaveAllPrice(model,3),
                ),
              ],
            ),
          ),
          BuildActionsView(addActivityData: widget.addActivityData)
        ],
      ),
    );
  }
}
