part of 'FirstPageWidgetImports.dart';

class BuildTypesView extends StatelessWidget {
  final FirstPageData pageData;

  const BuildTypesView({required this.pageData});

  @override
  Widget build(BuildContext context) {
    var cats = context.watch<CatsCubit>().state.cats;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(title: "اختر النوع", color: MyColors.primary, size: 10),
          SizedBox(height: 5),
          BlocBuilder<GenericBloc<String>, GenericState<String>>(
            bloc: pageData.selectCatCubit,
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
                          onChanged: (value) => pageData.selectCatCubit.onUpdateData(value!),
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
