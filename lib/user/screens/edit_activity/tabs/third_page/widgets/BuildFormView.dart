part of 'ThirdPageWidgetsImports.dart';

class BuildFormView extends StatelessWidget {
  final ThirdPageData pageData;
  final String catId;

  const BuildFormView({required this.pageData, required this.catId});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Form(
        key: pageData.formKey,
        child: Column(
          children: [
            // DropdownTextField<SubCategoryModel>(
            //   margin: EdgeInsets.only(top: 15),
            //   validate: (SubCategoryModel value)=>value.validateDropDown(context),
            //   label: "الفئة الفرعية",
            //   selectedItem: pageData.subCategoryModel,
            //   onChange: (SubCategoryModel model)=>pageData.onSubCatChange(model),
            //   finData: (value)async => await UserRepository(context).getSubCategories(catId,false),
            // ),

            BlocBuilder<GenericBloc<List<SubCategoryModel>>, GenericState<List<SubCategoryModel>>>(
              bloc: pageData.subCubit,
              builder: (context, state) {
                if (state is GenericUpdateState) {
                  return MultiDropDownField<SubCategoryModel>(
                    title: tr(context, "subCat"),
                    label: tr(context, "subCat"),
                    data: state.data,
                    selectedItems: pageData.selectedSub,
                    onConfirm: (List<SubCategoryModel> cats) =>
                        pageData.onSelectSubCat(cats),
                    onItemClick: (SubCategoryModel model) =>
                        pageData.onSubCatClick(model),
                  );
                }
                return Container(
                  height: 70,
                  alignment: Alignment.center,
                  child: CupertinoActivityIndicator(),
                );
              },
            ),
            SizedBox(height: 15),
            // DropdownTextField<CityModel>(
            //   margin: EdgeInsets.only(top: 15),
            //   validate: (CityModel value) => value.validateDropDown(context),
            //   label: "الموقع",
            //   selectedItem: pageData.locModel,
            //   onChange: (CityModel model) => pageData.onLocationChange(model),
            //   finData: (value) async =>
            //       await UserRepository(context).getLocations(false),
            // ),
            BlocBuilder<GenericBloc<List<CityModel>>, GenericState<List<CityModel>>>(
              bloc: pageData.locCubit,
              builder: (context, state) {
                if (state is GenericUpdateState) {
                  return MultiDropDownField<CityModel>(
                    title: tr(context, "location"),
                    label: tr(context, "location"),
                    data: state.data,
                    selectedItems: pageData.selectedLoc,
                    onConfirm: (List<CityModel> locations) =>
                        pageData.onSelectLocation(locations),
                    onItemClick: (CityModel model) =>
                        pageData.onLocationClick(model),
                  );
                }
                return Container(
                  height: 70,
                  alignment: Alignment.center,
                  child: CupertinoActivityIndicator(),
                );
              },
            ),
            RichTextFiled(
              label: tr(context, "descAr"),
              margin: EdgeInsets.only(top: 15),
              controller: pageData.descAr,
              max: 3,
              validate: (value) => value!.validateEmpty(context),
            ),
            RichTextFiled(
              label: tr(context, "descEn"),
              margin: EdgeInsets.only(top: 15),
              controller: pageData.descEn,
              max: 3,
              validate: (value) => value!.validateEmpty(context),
            ),
            RichTextFiled(
              label: tr(context, "termsAr"),
              margin: EdgeInsets.only(top: 15),
              controller: pageData.termsAr,
              max: 3,
              validate: (value) => value!.validateEmpty(context),
            ),
            RichTextFiled(
              label: tr(context, "termsEn"),
              margin: EdgeInsets.only(top: 15),
              controller: pageData.termsEn,
              max: 3,
              validate: (value) => value!.validateEmpty(context),
            ),
          ],
        ),
      ),
    );
  }
}
