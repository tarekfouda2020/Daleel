part of 'InformationImports.dart';

class InformationData{

  final TextEditingController name = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController account = new TextEditingController();
  final TextEditingController mail = new TextEditingController();


  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey<CustomButtonState>();

  final GenericBloc<UserModel?> userCubit = new GenericBloc(null);

  CityModel? cityModel;

  fetchData(BuildContext context)async{
    UserModel data = context.read<UserCubit>().state.model;
    initData(context,data);
    data = await UserRepository(context).getUserData(true);
    initData(context,data);
  }

  initData(BuildContext context,UserModel data){
    name.text = data.name??"";
    phone.text = data.mobile?.replaceAll("+966", "")??"";
    mail.text = data.email??"";
    account.text = data.accountNumber??"";
    cityModel = data.cityData;
    userCubit.onUpdateData(data);
  }

  changeCity(CityModel? model){
    cityModel = model;
  }

  void updateUserData(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      String phoneEn = Utils.convertDigitsToLatin(phone.text);
      String accountNum = Utils.convertDigitsToLatin(account.text);
      UpdateUserModel model = UpdateUserModel(
        name: name.text,
        accountNumber: accountNum,
        city: cityModel?.id,
        email: mail.text,
        mobile: phoneEn
      );
      var data = await UserRepository(context).updateUserData(model);
      btnKey.currentState!.animateReverse();
      Utils.saveUserData(data);
      context.read<UserCubit>().onUpdateUserData(data);
    }
  }

}