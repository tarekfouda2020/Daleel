part of 'ThirdPageImports.dart';

class ThirdPage extends StatefulWidget {
  final AddActivityData addActivityData;

  const ThirdPage({required this.addActivityData});
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: ListView(
        children: [
          DefaultButton(
            title: "Next",
            color: Colors.blue,
            onTap: () =>widget.addActivityData.goToNextPage(),
          ),
          DefaultButton(
            title: "Prev",
            color: Colors.blue,
            onTap: () =>widget.addActivityData.goToPreviousPage(),
          ),
        ],
      ),
    );
  }

}

