part of 'AddActivityImports.dart';

class AddActivity extends StatefulWidget {
  @override
  _AddActivityState createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  final AddActivityData addActivityData = new AddActivityData();

  @override
  void initState() {
    addActivityData.setInitialData(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: DefaultAppBar(
          title: "اضافة نشاط",
          leading: IconButton(
            icon: Icon(
              Icons.close,
              size: 25,
              color: MyColors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: Column(
        children: [
          BuildStepperView(
            activityData: addActivityData,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: PageView(
                controller: addActivityData.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  FirstPage(addActivityData: addActivityData),
                  SecondPage(addActivityData: addActivityData),
                  ThirdPage(addActivityData: addActivityData),
                  FourthPage(addActivityData: addActivityData),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
