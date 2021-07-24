part of 'EditPackageImports.dart';

class EditPackage extends StatefulWidget {
  final PackageType type;
  final int index;

  const EditPackage({required this.type, required this.index});
  @override
  _EditPackageState createState() => _EditPackageState();
}

class _EditPackageState extends State<EditPackage>{

  final EditPackageData packageData = new EditPackageData();


  @override
  void initState() {
    packageData.initData(context,widget.index,widget.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: DefaultAppBar(
          title: tr(context,"editPackage"),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: MyColors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(
          children: [
            Flexible(
              child: ListView(
                padding: EdgeInsets.only(top: 10),
                children: [
                  BuildFormView(
                    type: widget.type,
                    packageData: packageData,
                  ),
                ],
              ),
            ),
            BuildAddButton(
              type: widget.type,
              packageData: packageData,
              index: widget.index,
            ),
          ],
        ),
      ),
    );
  }
}

