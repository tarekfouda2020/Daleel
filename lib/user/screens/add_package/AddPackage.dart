part of 'AddPackageImports.dart';

class AddPackage extends StatefulWidget {
  final PackageType type;

  const AddPackage({required this.type});
  @override
  _AddPackageState createState() => _AddPackageState();
}

class _AddPackageState extends State<AddPackage> {
  final AddPackageData packageData = new AddPackageData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: DefaultAppBar(
          title: "اضافة باكدج",
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
            ),
          ],
        ),
      ),
    );
  }
}
