part of 'FirstPageWidgetImports.dart';


class BuildTypesView extends StatelessWidget {
  final EditActivityData activityData;

  const BuildTypesView({required this.activityData});

  @override
  Widget build(BuildContext context) {
    var cats = context.watch<CatsCubit>().state.cats;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(title: tr(context, "selectType"), color: MyColors.primary, size: 10),
          SizedBox(height: 5),
          BlocBuilder<GenericBloc<String>, GenericState<String>>(
            bloc: activityData.firstPageData.selectCatCubit,
            builder: (context, state) {
              return Container(
                height: 50,
                decoration: BoxDecoration(
                  color: MyColors.secondary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cats.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Radio<String>(
                          value: cats[index].id,
                          groupValue: state.data,
                          onChanged: (value) => activityData.firstPageData.onSelectCatChanged(activityData,context,value!),
                        ),
                        MyText(
                            title: cats[index].name,
                            color: MyColors.black,
                            size: 10,
                        )
                      ],
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
