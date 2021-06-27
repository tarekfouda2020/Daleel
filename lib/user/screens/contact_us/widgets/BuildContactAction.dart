part of 'ContactUsWidgetsImports.dart';

class BuildContactAction extends StatelessWidget {
  final ContactUsData contactUsData;

  const BuildContactAction({required this.contactUsData});
  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      btnKey: contactUsData.btnKey,
      title:tr(context,"send"),
      margin: EdgeInsets.symmetric(vertical: 20),
      onTap: ()=> contactUsData.setContactUs(context),
    );
  }
}

