part of 'ThirdPageWidgetsImports.dart';


class BuildFormView extends StatelessWidget {
  final ThirdPageData pageData;
  final String catId;

  const BuildFormView({required this.pageData, required this.catId});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: Form(
        key: pageData.formKey,
        child: Column(
          children: [
            DropdownTextField<SubCategoryModel>(
              margin: EdgeInsets.only(top: 15),
              validate: (SubCategoryModel value)=>value.validateDropDown(context),
              label: "الفئة الفرعية",
              selectedItem: pageData.subCategoryModel,
              onChange: (SubCategoryModel model)=>pageData.onSubCatChange(model),
              finData: (value)async => await UserRepository(context).getSubCategories(catId,false),
            ),

            DropdownTextField<CityModel>(
              margin: EdgeInsets.only(top: 15),
              validate: (CityModel value)=>value.validateDropDown(context),
              label: "الموقع",
              selectedItem: pageData.locModel,
              onChange: (CityModel model)=>pageData.onLocationChange(model),
              finData: (value)async => await UserRepository(context).getLocations(false),
            ),
            RichTextFiled(
              label: "الوصف بالعربي",
              margin: EdgeInsets.only(top: 15),
              controller: pageData.descAr,
              max: 3,
              validate: (value)=> value!.validateEmpty(context),
            ),
            RichTextFiled(
              label: "الوصف بالانجليزي",
              margin: EdgeInsets.only(top: 15),
              controller: pageData.descEn,
              max: 3,
              validate: (value)=> value!.validateEmpty(context),
            ),
            RichTextFiled(
              label: "الشروط الخاصة بالعربي",
              margin: EdgeInsets.only(top: 15),
              controller: pageData.termsAr,
              max: 3,
              validate: (value)=> value!.validateEmpty(context),
            ),
            RichTextFiled(
              label: "الشروط الخاصة بالانجليزي",
              margin: EdgeInsets.only(top: 15),
              controller: pageData.termsEn,
              max: 3,
              validate: (value)=> value!.validateEmpty(context),
            ),
          ],
        ),
      ),
    );
  }
}
