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
    CityModel(id: "percent", name: "نسبة"),
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
      title: "التاريخ من",
      onConfirm: (date){
        if (date!=null) {
          startDate = date.add(Duration(days: 1));
          fromCubit.onUpdateData(DateFormat("dd-MM-yyyy").format(date));
          toCubit.onUpdateData(DateFormat("dd-MM-yyyy").format(startDate));
        }
      },
    );
  }

  setToDate(BuildContext context) {
    AdaptivePicker.datePicker(
      context: context,
      minDate: startDate,
      initial: startDate,
      title: "التاريخ الي",
      onConfirm: (date){
        if (date!=null) {
          fromCubit.onUpdateData(DateFormat("dd-MM-yyyy").format(date));
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

}
