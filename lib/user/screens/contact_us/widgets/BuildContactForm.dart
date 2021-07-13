part of 'ContactUsWidgetsImports.dart';

class BuildContactForm extends StatelessWidget {
  final ContactUsData contactUsData;
  const BuildContactForm({required this.contactUsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: contactUsData.formKey,
        child: Column(
          children: [
            Image.asset(Res.logo,height: 170,),
            LabelTextField(
              label: tr(context,"name"),
              margin: EdgeInsets.only(top: 15),
              controller: contactUsData.name,
              type: TextInputType.name,
              action: TextInputAction.next,
              borderColor: MyColors.grey,
              validate: (value) => value!.validateEmpty(context),
            ),
            LabelTextField(
              label: tr(context, "mail"),
              margin: EdgeInsets.only(top: 15),
              controller: contactUsData.mail,
              type: TextInputType.emailAddress,
              action: TextInputAction.next,
              borderColor: MyColors.grey,
              validate: (value) => value!.validateEmail(context),
            ),
            RichTextFiled(
              label: tr(context, "message"),
              margin: EdgeInsets.only(top: 15),
              controller: contactUsData.note,
              type: TextInputType.multiline,
              action: TextInputAction.newline,
              borderColor: MyColors.grey,
              validate: (value) => value!.validateEmpty(context),
              max: 5,
            ),

            BuildContactAction(contactUsData: contactUsData),
          ],
        ),
      ),
    );
  }
}
