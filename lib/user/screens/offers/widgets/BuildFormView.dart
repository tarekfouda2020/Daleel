part of 'OfferWidgetImports.dart';

class BuildFormView extends StatelessWidget {
  final OffersData offersData;
  final PropertyModel model;

  const BuildFormView({required this.offersData, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Form(
        key: offersData.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocConsumer<GenericBloc<String>, GenericState<String>>(
              bloc: offersData.fromCubit,
              listener: (_, state) {
                offersData.from.text = state.data;
              },
              builder: (context, state) {
                return InkWellTextField(
                  controller: offersData.from,
                  label: "التاريخ من",
                  onTab: () => offersData.setFromDate(context),
                  margin: EdgeInsets.only(top: 15),
                  validate: (value) => value!.validateEmpty(context),
                );
              },
            ),

            BlocConsumer<GenericBloc<String>, GenericState<String>>(
              bloc: offersData.toCubit,
              listener: (_, state) {
                offersData.to.text = state.data;
              },
              builder: (context, state) {
                return InkWellTextField(
                  controller: offersData.to,
                  label: "التاريخ الي",
                  onTab: () => offersData.setToDate(context),
                  margin: EdgeInsets.only(top: 15),
                  validate: (value) => value!.validateEmpty(context),
                );
              },
            ),

            DropdownTextField<CityModel>(
              margin: EdgeInsets.only(top: 15),
              validate: (CityModel value) => value.validateDropDown(context),
              label: "النوع",
              showSearchBox: false,
              showClearButton: false,
              mode: Mode.MENU,
              selectedItem: offersData.selectedType,
              onChange: (CityModel model) => offersData.onTypeChange(model),
              data: offersData.types,
            ),

            BlocBuilder<GenericBloc<String>, GenericState<String>>(
              bloc: offersData.typeCubit,
              builder: (context, state) {
                return Visibility(
                  visible: state.data=="price",
                  child: LabelTextField(
                    controller: offersData.price,
                    validate: (value)=> value!.validateEmpty(context),
                    margin: EdgeInsets.only(top: 15),
                    type: TextInputType.number,
                    action: TextInputAction.next,
                    label: "السعر الجديد",
                  ),
                  replacement: LabelTextField(
                    controller: offersData.percent,
                    validate: (value)=> value!.validateEmpty(context),
                    margin: EdgeInsets.only(top: 15),
                    action: TextInputAction.done,
                    label: "النسبة",
                  ),
                );
              },
            ),

            Visibility(
              visible: CategoryModel.getTypeValue(model.category.tag)==CategoriesTypes.secondCat,
              child: DropdownTextField<CityModel>(
                margin: EdgeInsets.only(top: 15),
                validate: (CityModel value) => value.validateDropDown(context),
                label: "نوع الباكدج",
                showSearchBox: false,
                showClearButton: false,
                mode: Mode.MENU,
                selectedItem: offersData.selectedPackage,
                onChange: (CityModel model) => offersData.onPackageChange(model),
                data: offersData.packages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
