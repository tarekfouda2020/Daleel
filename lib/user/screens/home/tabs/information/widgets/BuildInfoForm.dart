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
            title: "الاسم",
            value: user.name??"",
          ),
          BuildInfoItem(
            title: "رقم الجوال",
            value: user.mobile??"",
          ),
          BuildInfoItem(
            title: "رقم الحساب البنكي",
            value: user.accountNumber??"",
          ),
          BuildInfoItem(
            title: "البريد الالكتروني",
            value: user.email??"",
          ),
          BuildInfoItem(
            title: "المدينة",
            value: user.city??"",
          ),
        ],
      ),
    );
  }
}

