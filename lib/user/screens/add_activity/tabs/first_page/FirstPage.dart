part of 'FirstPageImports.dart';


class FirstPage extends StatefulWidget {
  final AddActivityData addActivityData;

  const FirstPage({required this.addActivityData});
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.secondary,
      child: ListView(
        children: [
          DefaultButton(
            title: "Next",
            onTap: () =>widget.addActivityData.goToNextPage(),
          ),
        ],
      ),
    );
  }
}
