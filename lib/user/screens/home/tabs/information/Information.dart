part of 'InformationImports.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information>{

   InformationData informationData = new InformationData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: DefaultAppBar(title: tr(context, "info"),back: false,),
        preferredSize: Size.fromHeight(60),
      ),

      body: ListView(
        children: [
          BuildInfoForm()
        ],
      ),

    );
  }
}

