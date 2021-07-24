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

  late List<CityModel> types;

  late List<CityModel> packages;

  initData(BuildContext context) {
    bool lang = context.read<LangCubit>().state.locale.languageCode == "ar";
    types = [
      CityModel(id: "price", name: lang ? "سعر جديد" : "New price"),
      CityModel(id: "percentage", name: lang ? "نسبة" : "Percentage"),
    ];
    packages = [
      CityModel(id: "package", name: lang ? "سعر الباقة" : "Package price"),
      CityModel(id: "person", name: lang ? "سعر الفرد" : "Price per person"),
    ];
    selectedType = types[0];
  }

  CityModel? selectedType;
  CityModel? selectedPackage;

  DateTime startDate = DateTime.now();

  setFromDate(BuildContext context) {
    AdaptivePicker.datePicker(
      context: context,
      title: tr(context, "dateFrom"),
      onConfirm: (date) {
        if (date != null) {
          startDate = date;
          fromCubit.onUpdateData(DateFormat("yyyy-MM-dd").format(date));
          toCubit.onUpdateData(DateFormat("yyyy-MM-dd").format(date));
        }
      },
    );
  }

  setToDate(BuildContext context) {
    AdaptivePicker.datePicker(
      context: context,
      minDate: startDate,
      initial: startDate,
      title: tr(context, "dateTo"),
      onConfirm: (date) {
        if (date != null) {
          toCubit.onUpdateData(DateFormat("yyyy-MM-dd").format(date));
        }
      },
    );
  }

  onTypeChange(CityModel model) {
    selectedType = model;
    typeCubit.onUpdateData(model.id);
  }

  onPackageChange(CityModel model) {
    selectedPackage = model;
  }

  saveOfferData(BuildContext context, PropertyModel propertyModel) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      AddOfferModel model = AddOfferModel(
          from: fromCubit.state.data,
          to: toCubit.state.data,
          type: selectedType?.id,
          packageType: selectedPackage?.id,
          percentage: double.parse(percent.text.isEmpty ? "0" : percent.text),
          price: double.parse(price.text.isEmpty ? "0" : price.text),
          property: propertyModel.id);
      var result = await UserRepository(context).addOffer(model);
      btnKey.currentState!.animateReverse();
      if (result) {
        LoadingDialog.showToastNotification(
            tr(context, "offerAddedSuccessfully"));
        Navigator.of(context).pop();
      }
    }
  }
}
