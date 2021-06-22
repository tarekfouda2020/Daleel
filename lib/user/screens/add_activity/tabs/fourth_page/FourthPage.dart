part of 'FourthPageImports.dart';

class FourthPage extends StatefulWidget {
  final AddActivityData addActivityData;

  const FourthPage({required this.addActivityData});
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage>{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: ListView(
        children: [
          DefaultButton(
            title: "Prev",
            color: Colors.black,
            onTap: () =>widget.addActivityData.goToPreviousPage(),
          ),
        ],
      ),
    );
  }
}

