part of 'OffersImports.dart';

class OffersData {

  final GlobalKey<FormState> formKey = new GlobalKey();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey();

  final GenericBloc<String> fromCubit = new GenericBloc("");
  final GenericBloc<String> toCubit = new GenericBloc("");
  final GenericBloc<String> typeCubit = new GenericBloc("price");

  TextEditingController from = new TextEditingController();
  TextEditingController to = new TextEditingController();
  TextEditingController price = new TextEditingController();
  TextEditingController percent = new TextEditingController();

  var types = [
    CityModel(id: "price", name: "سعر جديد"),
    CityModel(id: "percentage", name: "نسبة"),
  ];

  var packages = [
    CityModel(id: "package", name: "سعر الفرد"),
    CityModel(id: "person", name: "سعر الباكدج"),
  ];

  CityModel? selectedType;
  CityModel? selectedPackage;

  DateTime startDate = DateTime.now();

  setFromDate(BuildContext context) {
    AdaptivePicker.datePicker(
      context: context,
      title: tr(context,"dateFrom"),
      onConfirm: (date){
        if (date!=null) {
          startDate = date.add(Duration(days: 1));
          fromCubit.onUpdateData(DateFormat("yyyy-MM-dd").format(date));
          toCubit.onUpdateData("");
        }
      },
    );
  }

  setToDate(BuildContext context) {
    AdaptivePicker.datePicker(
      context: context,
      minDate: startDate,
      initial: startDate,
      title: tr(context,"dateTo"),
      onConfirm: (date){
        if (date!=null) {
          toCubit.onUpdateData(DateFormat("yyyy-MM-dd").format(date));
        }
      },
    );
  }

  onTypeChange(CityModel model){
    selectedType = model;
    typeCubit.onUpdateData(model.id);
  }

  onPackageChange(CityModel model){
    selectedPackage = model;
  }

  saveOfferData(BuildContext context, PropertyModel propertyModel)async{
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      AddOfferModel model = AddOfferModel(
        from: fromCubit.state.data,
        to: fromCubit.state.data,
        type: selectedType?.id,
        packageType: selectedPackage?.id,
        percentage: double.parse(percent.text.isEmpty?"0":percent.text),
        price: double.parse(price.text.isEmpty?"0":price.text),
        property: propertyModel.id
      );
      var result = await UserRepository(context).addOffer(model);
      if (result) {
        LoadingDialog.showToastNotification(tr(context, "offerAddedSuccessfully"));
        btnKey.currentState!.animateReverse();
        Navigator.of(context).pop();
      }
    }
  }


}
