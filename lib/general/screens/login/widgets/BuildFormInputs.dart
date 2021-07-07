part of 'LoginWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final LoginData loginData;

  const BuildFormInputs({required this.loginData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconTextFiled(
            label: tr(context,"phone"),
            controller: loginData.phone,
            margin: const EdgeInsets.symmetric(vertical: 30),
            action: TextInputAction.next,
            type: TextInputType.number,
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                MyText(title: "+966", color: MyColors.black, size: 14,fontWeight: FontWeight.w600,),
              ],
            ),
            validate: (value) => value!.validateEmpty(context),
          ),
          // LabelTextField(
          //   label: tr(context,"password"),
          //   controller: loginData.password,
          //   margin: const EdgeInsets.symmetric(vertical: 5),
          //   validate: (value) => value!.validateEmpty(context),
          //   isPassword: true,
          //   action: TextInputAction.done,
          //   onSubmit: () => loginData.userLogin(context),
          // ),
        ],
      ),
    );
  }
}
