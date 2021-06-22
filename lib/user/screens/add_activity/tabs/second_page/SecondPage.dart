part of 'SecondPageImports.dart';


class SecondPage extends StatefulWidget {
  final AddActivityData addActivityData;

  const SecondPage({required this.addActivityData});
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.primary,
      child: ListView(
        children: [
          DefaultButton(
            title: "Prev",
            color: Colors.red,
            onTap: () =>widget.addActivityData.goToPreviousPage(),
          ),
        ],
      ),
    );
  }
}

