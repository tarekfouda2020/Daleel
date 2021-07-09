part of 'FourthPageWidgetImports.dart';

class BuildFeaturesView extends StatelessWidget {
  final FourthPageData pageData;

  const BuildFeaturesView({required this.pageData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<CityModel>>, GenericState<List<CityModel>>>(
      bloc: pageData.optionsCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  title: "اضف المميزات",
                  color: MyColors.secondary,
                  size: 10,
                  fontWeight: FontWeight.w600,
                ),
                MultiDropDownField<CityModel>(
                  title: "المميزات",
                  label: "المميزات",
                  data: state.data,
                  selectedItems: pageData.selectedOptions,
                  onConfirm: (List<CityModel> options)=>pageData.onSelectOptions(options),
                  onItemClick: (CityModel model)=> pageData.onOptionClick(model),
                )
              ],
            ),
          );
        }
        return Container(
          height: 100,
          alignment: Alignment.center,
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }
}
