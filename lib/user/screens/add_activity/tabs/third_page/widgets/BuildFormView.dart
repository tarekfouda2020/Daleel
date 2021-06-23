part of 'ThirdPageWidgetsImports.dart';


class BuildFormView extends StatelessWidget {
  final ThirdPageData pageData;

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
              controller: pageData.branch,
              validate: (value)=>value!.validateEmpty(context),
              label: "الفئة الفرعية",
              type: TextInputType.name,
              action: TextInputAction.next,
            ),
            InkWellTextField(
              controller: pageData.location,
              margin: EdgeInsets.only(top: 15),
              validate: (value)=>value!.validateEmpty(context),
              label: "الموقع",
              type: TextInputType.name,
              icon: Icon(Icons.location_on,size: 20,),
              onTab: (){},
            ),
            RichTextFiled(
              label: "الوصف بالعربي",
              margin: EdgeInsets.only(top: 15),
              controller: pageData.descAr,
              max: 3,
              validate: (value)=> value!.noValidate(),
            ),
            RichTextFiled(
              label: "الوصف بالانجليزي",
              margin: EdgeInsets.only(top: 15),
              controller: pageData.descAr,
              max: 3,
              validate: (value)=> value!.noValidate(),
            ),
            RichTextFiled(
              label: "الشروط الخاصة بالعربي",
              margin: EdgeInsets.only(top: 15),
              controller: pageData.termsAr,
              max: 3,
              validate: (value)=> value!.noValidate(),
            ),
            RichTextFiled(
              label: "الشروط الخاصة بالانجليزي",
              margin: EdgeInsets.only(top: 15),
              controller: pageData.termsEn,
              max: 3,
              validate: (value)=> value!.noValidate(),
            ),
          ],
        ),
      ),
    );
  }
}
