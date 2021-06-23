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
              label: "الاسم بالعربي",
              type: TextInputType.name,
              action: TextInputAction.next,
            ),
            LabelTextField(
              controller: pageData.nameEn,
              margin: EdgeInsets.only(top: 15),
              validate: (value)=>value!.validateEmpty(context),
              label: "الاسم بالانجليزي",
              type: TextInputType.name,
              action: TextInputAction.next,
            ),
            LabelTextField(
              controller: pageData.number,
              margin: EdgeInsets.only(top: 15),
              validate: (value)=>value!.validateEmpty(context),
              label: "عدد الاشخاص",
              type: TextInputType.number,
              action: TextInputAction.next,
            ),
            LabelTextField(
              controller: pageData.city,
              margin: EdgeInsets.only(top: 15),
              validate: (value)=>value!.validateEmpty(context),
              label: "المدينة",
              type: TextInputType.name,
              action: TextInputAction.next,
            ),
          ],
        ),
      ),
    );
  }
}
