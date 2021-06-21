part of 'InformationWidgetImports.dart';

class BuildInfoForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          BuildInfoItem(
            title: "الاسم",
            value: "طارق فودة",
          ),
          BuildInfoItem(
            title: "رقم الجوال",
            value: "01551575332",
          ),
          BuildInfoItem(
            title: "رقم الحساب البنكي",
            value: "3247865746354214",
          ),
          BuildInfoItem(
            title: "البريد الالكتروني",
            value: "tarekfouda0@gmail.com",
          ),
          BuildInfoItem(
            title: "المدينة",
            value: "المنصورة",
          ),
        ],
      ),
    );
  }
}

