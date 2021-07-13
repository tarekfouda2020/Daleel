part of 'InformationWidgetImports.dart';

class BuildInfoForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserCubit>().state.model;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          BuildInfoItem(
            title: tr(context, "name"),
            value: user.name??"",
          ),
          BuildInfoItem(
            title: tr(context, "phone"),
            value: user.mobile??"",
          ),
          BuildInfoItem(
            title: tr(context, "accountNum"),
            value: user.accountNumber??"",
          ),
          BuildInfoItem(
            title: tr(context, "mail"),
            value: user.email??"",
          ),
          BuildInfoItem(
            title: tr(context,"city"),
            value: user.city??"",
          ),
        ],
      ),
    );
  }
}

