part of 'ActivitiesImports.dart';

class Activities extends StatefulWidget {
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities>{

   ActivitiesData activitiesData = new ActivitiesData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: DefaultAppBar(title: "الانشطة",back: false,),
        preferredSize: Size.fromHeight(60),
      ),

      body: CupertinoScrollbar(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return BuildActivityItem();
          },

        ),
      ),

      floatingActionButton: BuildFloatAction(),

    );
  }
}

