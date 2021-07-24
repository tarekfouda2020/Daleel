part of 'EditPackageImports.dart';

class EditPackageData{

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

  initData(BuildContext context,int index,PackageType type){
    var package = context.read<PackageCubit>();
    if (type == PackageType.package) {
      initPackage(package.state.model.packages[index]);
    }else{
      initPerson(package.state.model.persons[index]);
    }
  }

  initPerson(AddpackagePersonModel model){
    nameAr.text=model.nameAr??"";
    nameEn.text=model.nameEn??"";
    descAr.text=model.descAr??"";
    descEn.text=model.descEn??"";
    maxNum.text=model.maximumCount?.toString()??"";
    minNum.text=model.minimumCount?.toString()??"";
    pricePerPerson.text=model.pricePerPerson?.toString()??"";
    numberOfReservations.text=model.numberOfBookingsPerDay?.toString()??"";
  }

  initPackage(AddPackageModel model){
    nameAr.text=model.nameAr??"";
    nameEn.text=model.nameEn??"";
    descAr.text=model.descAr??"";
    descEn.text=model.descEn??"";
    price.text = model.packagePrice?.toString()??"";
    number.text=model.numberOfPersons?.toString()??"";
    numberOfReservations.text=model.numberOfBookingsPerDay?.toString()??"";
  }


  onSavePackage(BuildContext context,PackageType type,int index){
    if (formKey.currentState!.validate()) {
      type==PackageType.person?addPerson(context,index):addPackage(context,index);
    }
  }

  addPackage(BuildContext context,int index){
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
    package.state.model.packages[index]= model;
    package.onUpdateData(package.state.model);
    Navigator.of(context).pop();
  }

  addPerson(BuildContext context,int index){
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
    package.state.model.persons[index]= model;
    package.onUpdateData(package.state.model);
    Navigator.of(context).pop();
  }

}