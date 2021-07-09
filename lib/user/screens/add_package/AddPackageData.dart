part of 'AddPackageImports.dart';

class AddPackageData{

  GlobalKey<FormState> formKey = new GlobalKey();
  GlobalKey<CustomButtonState> btnKey = new GlobalKey();

  TextEditingController nameAr = TextEditingController();
  TextEditingController nameEn = TextEditingController();
  TextEditingController descAr = TextEditingController();
  TextEditingController descEn = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController maxNum = TextEditingController();
  TextEditingController minNum = TextEditingController();
  TextEditingController pricePerPerson = TextEditingController();
  TextEditingController numberOfReservations = TextEditingController();


  onSavePackage(BuildContext context,PackageType type){
    if (formKey.currentState!.validate()) {

    }
  }

  addPackage(BuildContext context){
   var package = context.read<PackageCubit>();
   AddPackageModel model = AddPackageModel(
     descAr: descAr.text,
     descEn: descEn.text,
     nameAr: nameAr.text,
     nameEn: nameEn.text,
     numberOfBookingsPerDay: int.parse(numberOfReservations.text),
     numberOfPersons: int.parse(number.text),
     packagePrice: double.parse(price.text)
   );
   package.state.model.packages.add(model);
   package.onUpdateData(package.state.model);
   Navigator.of(context).pop();
  }

  addPerson(BuildContext context){
   var package = context.read<PackageCubit>();
   AddpackagePersonModel model = AddpackagePersonModel(
     descAr: descAr.text,
     descEn: descEn.text,
     nameAr: nameAr.text,
     nameEn: nameEn.text,
     numberOfBookingsPerDay: int.parse(numberOfReservations.text),
     numberOfPersons: 0,
     packagePrice: 0,
     pricePerPerson: double.parse(pricePerPerson.text),
     maximumCount: int.parse(maxNum.text),
     minimumCount: int.parse(minNum.text),
   );
   package.state.model.persons.add(model);
   package.onUpdateData(package.state.model);
   Navigator.of(context).pop();
  }

}