part of 'InformationWidgetImports.dart';

class BuildInfoForm extends StatelessWidget {
  final UserModel model;

  const BuildInfoForm({required this.model});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          BuildInfoItem(
            title: tr(context, "name"),
            value: model.name??"",
          ),
          BuildInfoItem(
            title: tr(context, "phone"),
            value: model.mobile??"",
          ),
          BuildInfoItem(
            title: tr(context, "accountNum"),
            value: model.accountNumber??"",
          ),
          BuildInfoItem(
            title: tr(context, "mail"),
            value: model.email??"",
          ),
          BuildInfoItem(
            title: tr(context,"city"),
            value: model.cityData?.name??"",
          ),
        ],
      ),
    );
  }
}

