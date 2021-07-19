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
    screenData.allSectionsPrice.allDeptFields[7].value.text=widget.addActivityData.activityModel.nameEn??"";
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
                  title: tr(context, "price"),
                  color: MyColors.primary,
                  size: 16,
                  fontWeight: FontWeight.w600,
                ),
                BuildActivityCard(
                  model: screenData.allSectionsPrice,
                  onSave: (model) =>screenData.setSaveAllPrice(model,1,context),
                ),
                BlocBuilder<GenericBloc, GenericState>(
                  bloc: screenData.catsCountCubit,
                  builder: (context, state) {
                    return Column(
                      children: [
                        BuildAddNewCat(
                          state: state.data,
                          screenData: screenData,
                        ),
                        BuildFirstDeptCard(
                          title: tr(context, "firstDept"),
                          model: screenData.firstSectionPrice,
                          addActivityData: widget.addActivityData,
                          state: state.data,
                          type: 1,
                        ),
                        BuildFirstDeptCard(
                          title: tr(context, "secondDept"),
                          model: screenData.secondSectionPrice,
                          addActivityData: widget.addActivityData,
                          state: state.data,
                          type: 2,
                        ),
                      ],
                    );
                  },
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
