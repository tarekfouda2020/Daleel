part of 'EditActivityImports.dart';

class EditActivity extends StatefulWidget {
  @override
  _EditActivityState createState() => _EditActivityState();
}

class _EditActivityState extends State<EditActivity>{

  final EditActivityData activityData = new EditActivityData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: DefaultAppBar(
          title: "تعديل النشاط",
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
            activityData: activityData,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: PageView(
                controller: activityData.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  FirstPage(activityData: activityData),
                  SecondPage(activityData: activityData),
                  ThirdPage(activityData: activityData),
                  FourthPage(activityData: activityData),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}

