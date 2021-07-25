part of 'FourthPageWidgetImports.dart';

class BuildFeaturesView extends StatelessWidget {
  final FourthPageData pageData;

  const BuildFeaturesView({required this.pageData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<AddOptionModel>>, GenericState<List<AddOptionModel>>>(
      bloc: pageData.optionsCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Form(
              key: pageData.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: tr(context,"addFeatures"),
                    color: MyColors.secondary,
                    size: 10,
                    fontWeight: FontWeight.w600,
                  ),
                  BlocBuilder<GenericBloc<List<AddOptionModel>>,
                      GenericState<List<AddOptionModel>>>(
                    bloc: pageData.currentCubit,
                    builder: (context, optionState) {
                      return MultiDropDownField<AddOptionModel>(
                        title: tr(context, "features"),
                        label: tr(context, "features"),
                        data: state.data,
                        selectedItems: optionState.data,
                        onConfirm: (List<AddOptionModel> options) =>
                            pageData.onSelectOptions(options),
                        onItemClick: (AddOptionModel model) =>
                            pageData.onOptionClick(model),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  BlocBuilder<GenericBloc<List<AddOptionModel>>,
                      GenericState<List<AddOptionModel>>>(
                    bloc: pageData.currentCubit,
                    builder: (context, optionState) {
                      return Column(
                        children:
                        List.generate(optionState.data.length, (index) {
                          return Column(
                            children: [
                              RichTextFiled(
                                controller: optionState.data[index].descAr,
                                margin: EdgeInsets.only(top: 10),
                                label:
                                "وصف ${optionState.data[index].name} بالعربي ",
                                max: 3,
                                validate: (value) =>
                                    value!.validateEmpty(context),
                              ),
                              RichTextFiled(
                                controller: optionState.data[index].descEn,
                                margin: EdgeInsets.only(top: 10),
                                label:
                                "وصف ${optionState.data[index]
                                    .name} بالانجليزي ",
                                max: 3,
                                validate: (value) =>
                                    value!.validateEmpty(context),
                              ),
                            ],
                          );
                        }),
                      );
                    },
                  ),
                  MyText(
                    title: tr(context,"locationOnMap"),
                    color: MyColors.secondary,
                    size: 10,
                    fontWeight: FontWeight.w600,
                  ),
                  BlocConsumer<LocationCubit,LocationState>(
                    bloc: pageData.locCubit,
                    listener: (context,state){
                      pageData.location.text=state.model.address;
                      pageData.lat=state.model.lat;
                      pageData.lng=state.model.lng;
                    },
                    builder: (context,state){
                      return InkWellTextField(
                        hint: tr(context,"locationOnMap"),
                        margin: EdgeInsets.only(bottom: 15),
                        controller: pageData.location,
                        type: TextInputType.text,
                        borderColor: MyColors.grey,
                        icon: Icon(Icons.location_on,size: 20,color: MyColors.black),
                        validate: (value) => value!.validateEmpty(context),
                        onTab: ()=>Utils.navigateToLocationAddress(context,pageData.locCubit),
                      );
                    },
                  ),

                ],
              ),
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
