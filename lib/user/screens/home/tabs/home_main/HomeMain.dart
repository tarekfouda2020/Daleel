part of 'HomeMainImports.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  HomeMainData homeMainData = new HomeMainData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: DefaultAppBar(title: "الحجوزات",back: false),
        preferredSize: Size.fromHeight(60),
      ),
      body: Column(
        children: [
          BuildFilterView(),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return BuildOrderItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
