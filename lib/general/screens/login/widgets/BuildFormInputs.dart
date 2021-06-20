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
          LabelTextField(
            label: tr(context,"phone"),
            controller: loginData.phone,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.number,
            validate: (value) => value!.validatePhone(context),
          ),
          LabelTextField(
            label: tr(context,"password"),
            controller: loginData.password,
            margin: const EdgeInsets.symmetric(vertical: 5),
            validate: (value) => value!.validateEmpty(context),
            isPassword: true,
            action: TextInputAction.done,
            onSubmit: () => loginData.userLogin(context),
          ),
        ],
      ),
    );
  }
}
