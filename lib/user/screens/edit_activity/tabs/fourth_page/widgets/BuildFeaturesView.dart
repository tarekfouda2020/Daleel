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
                  MultiDropDownField<CityModel>(
                    title: tr(context,"features"),
                    label: tr(context,"features"),
                    data: state.data,
                    selectedItems: pageData.selectedOptions,
                    onConfirm: (List<CityModel> options)=>pageData.onSelectOptions(options),
                    onItemClick: (CityModel model)=> pageData.onOptionClick(model),
                  ),
                  SizedBox(height: 20),
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
