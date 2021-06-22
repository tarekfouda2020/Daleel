part of 'AddActivityImports.dart';

class AddActivity extends StatefulWidget {
  @override
  _AddActivityState createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity>{

  final AddActivityData addActivityData = new AddActivityData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: DefaultAppBar(title: "اضافة نشاط",),
        preferredSize: Size.fromHeight(60),
      ),

      body: Column(
        children: [
          BuildStepperView(activityData: addActivityData,),
          Flexible(
            child: PageView(
              controller: addActivityData.pageController,
              children: [
                FirstPage(addActivityData: addActivityData),
                SecondPage(addActivityData: addActivityData),
                SecondPage(addActivityData: addActivityData),
                SecondPage(addActivityData: addActivityData),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

