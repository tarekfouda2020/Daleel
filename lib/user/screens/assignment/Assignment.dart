part of 'AssignmentImports.dart';

class Assignment extends StatefulWidget {
  final bool isTerm;

  const Assignment({required this.isTerm});
  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  AssignmentData assignmentData = new AssignmentData();


  @override
  void initState() {
    assignmentData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var settings = context.watch<SettingCubit>().state.model;
    return Scaffold(
      appBar: PreferredSize(
        child: DefaultAppBar(title: widget.isTerm? tr(context, "terms") : tr(context, "assignment")),
        preferredSize: Size.fromHeight(60),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          Image.asset(Res.logo,height: 170,),
          MyText(
            title: widget.isTerm? settings?.privacyPolicy??"" : settings?.rulesOfPropertyOwners??"",
            color: MyColors.blackOpacity,
            size: 12,
            alien: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
