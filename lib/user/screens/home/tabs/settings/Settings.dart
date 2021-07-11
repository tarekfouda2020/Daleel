part of 'SettingsImports.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  SettingsData settingsData = new SettingsData();

  @override
  Widget build(BuildContext context) {
    var settings = context.watch<SettingCubit>().state.model;
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
            page: Assignment(isTerm: false),
          ),
          BuildSettingItem(
            title: 'تواصل معنا',
            icon: Icons.contact_mail_outlined,
            onTap: ()=>Utils.launchWhatsApp("+${settings?.supportNumber??"966555873010"}"),
          ),
          BuildSettingItem(
            title: 'الشروط والاحكام',
            icon: Icons.reorder_sharp,
            page: Assignment(isTerm: true),
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
