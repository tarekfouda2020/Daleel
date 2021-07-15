part of 'ActiveAccountImports.dart';

class ActiveAccountData {

  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey<CustomButtonState>();

  final TextEditingController code = new TextEditingController();


  void onActiveAccount(BuildContext context, String userId) async {
    if (code.text.isNotEmpty) {
      btnKey.currentState!.animateForward();
      await GeneralRepository(context).verifyUser(code.text, userId);
      btnKey.currentState!.animateReverse();
    }else{
      LoadingDialog.showSimpleToast("من فضلك ادخل كود التحقق");
    }
  }

  void onResendCode(BuildContext context, String userId) async {
    await GeneralRepository(context).resendCode(userId);
  }
}
