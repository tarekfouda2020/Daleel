part of 'InformationWidgetImports.dart';

class BuildInfoForm extends StatelessWidget {
  final UserModel model;
  final InformationData informationData;

  const BuildInfoForm({required this.model, required this.informationData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: informationData.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildInfoItem(
              title: tr(context, "name"),
              value: model.name ?? "",
            ),
            LabelTextField(
              controller: informationData.name,
              hint: tr(context, "name"),
              type: TextInputType.name,
              action: TextInputAction.next,
              validate: (value)=> value!.validateEmpty(context),
            ),
            BuildInfoItem(
              title: tr(context, "phone"),
              value: model.mobile ?? "",
            ),
            IconTextFiled(
              controller: informationData.phone,
              hint: tr(context, "phone"),
              type: TextInputType.number,
              action: TextInputAction.next,
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText(title: "+966", color: MyColors.black, size: 14,fontWeight: FontWeight.w600,),
                ],
              ),
              validate: (value)=> value!.validateEmpty(context),
            ),
            BuildInfoItem(
              title: tr(context, "accountNum"),
              value: model.accountNumber ?? "",
            ),
            LabelTextField(
              controller: informationData.account,
              hint: tr(context, "accountNum"),
              type: TextInputType.number,
              action: TextInputAction.next,
              validate: (value)=> value!.noValidate(),
            ),
            BuildInfoItem(
              title: tr(context, "mail"),
              value: model.email ?? "",
            ),

            LabelTextField(
              controller: informationData.mail,
              hint: tr(context, "mail"),
              type: TextInputType.emailAddress,
              action: TextInputAction.next,
              validate: (value)=> value!.validateEmail(context),
            ),
            BuildInfoItem(
              title: tr(context, "city"),
              value: model.cityData?.name ?? "",
            ),

            DropdownTextField<CityModel>(
              hint: tr(context, "city"),
              validate: (CityModel value)=> value.validateDropDown(context),
              useName: true,
              onChange: (CityModel model)=>informationData.changeCity(model),
              selectedItem: informationData.cityModel,
              finData: (value) async => await UserRepository(context).getCities(false),
            ),
          ],
        ),
      ),
    );
  }
}
