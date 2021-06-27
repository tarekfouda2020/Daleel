part of 'SettingsImports.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  SettingsData settingsData = new SettingsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: DefaultAppBar(
          title: "الاعدادات",
          back: false,
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: ListView(
        children: [
          BuildSettingItem(
            title: 'العقد',
            icon: Icons.assessment_outlined,
            page: Assignment(),
          ),
          BuildSettingItem(
            title: 'تواصل معنا',
            icon: Icons.contact_mail_outlined,
            page: ContactUs(),
          ),
          BuildSettingItem(
            title: 'الشروط والاحكام',
            icon: Icons.reorder_sharp,
            page: Assignment(),
          ),
          BuildSettingItem(
            title: 'اللغة',
            icon: Icons.language,
            page: Languages(),
          ),
        ],
      ),
    );
  }
}
