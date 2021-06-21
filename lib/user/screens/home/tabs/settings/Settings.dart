part of 'SettingsImports.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings>{

   SettingsData settingsData = new SettingsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: DefaultAppBar(title: "الاعدادات",back: false,),
        preferredSize: Size.fromHeight(60),
      ),

      body: ListView(
        children: [

        ],
      ),

    );
  }
}

