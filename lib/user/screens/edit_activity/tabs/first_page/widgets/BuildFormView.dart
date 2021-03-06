part of 'FirstPageWidgetImports.dart';

class BuildFormView extends StatelessWidget {
  final FirstPageData pageData;

  const BuildFormView({required this.pageData});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: Form(
        key: pageData.formKey,
        child: Column(
          children: [
            LabelTextField(
              controller: pageData.nameAr,
              validate: (value)=>value!.validateEmpty(context),
              label: tr(context, "nameAr"),
              type: TextInputType.name,
              action: TextInputAction.next,
            ),
            LabelTextField(
              controller: pageData.nameEn,
              margin: EdgeInsets.only(top: 15),
              validate: (value)=>value!.validateEmpty(context),
              label: tr(context, "nameEn"),
              type: TextInputType.name,
              action: TextInputAction.next,
            ),
            // LabelTextField(
            //   controller: pageData.number,
            //   margin: EdgeInsets.only(top: 15),
            //   validate: (value)=>value!.validateEmpty(context),
            //   label: "عدد الاشخاص",
            //   type: TextInputType.number,
            //   action: TextInputAction.next,
            // ),
            DropdownTextField<CityModel>(
              margin: EdgeInsets.only(top: 15),
              validate: (CityModel value)=>value.validateDropDown(context),
              label: tr(context, "city"),
              selectedItem: pageData.cityModel,
              useName: false,
              onChange: (CityModel model)=>pageData.onCityChange(model),
              finData: (value)async => await UserRepository(context).getCities(false),
            ),
          ],
        ),
      ),
    );
  }
}
