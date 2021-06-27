part of 'AssignmentImports.dart';

class Assignment extends StatefulWidget {
  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  AssignmentData assignmentData = new AssignmentData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: DefaultAppBar(title: "العقد"),
        preferredSize: Size.fromHeight(60),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          Image.asset(Res.logo,height: 170,),
          MyText(
            title: "هذا النص يمكن استبدالة بنص اخر هذا النص يمكن استبدالة بنص اخر" * 5,
            color: MyColors.blackOpacity,
            size: 12,
            alien: TextAlign.center,
          ),
          SizedBox(height: 10),
          MyText(
            title: "هذا النص يمكن استبدالة بنص اخر هذا النص يمكن استبدالة بنص اخر" * 5,
            color: MyColors.blackOpacity,
            size: 12,
            alien: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
