part of 'EditActivityImports.dart';

class EditActivity extends StatefulWidget {
  final PropertyModel model;

  const EditActivity({required this.model});
  @override
  _EditActivityState createState() => _EditActivityState();
}

class _EditActivityState extends State<EditActivity>{

  final EditActivityData activityData = new EditActivityData();

  @override
  void initState() {
    activityData.setInitialData(context,widget.model);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: DefaultAppBar(
          title: tr(context,"editActivity"),
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
                  FirstPage(addActivityData: activityData,),
                  SecondPage(addActivityData: activityData),
                  ThirdPage(addActivityData: activityData),
                  FourthPage(addActivityData: activityData),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

