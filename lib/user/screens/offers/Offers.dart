part of 'OffersImports.dart';

class Offers extends StatefulWidget {
  final PropertyModel model;

  const Offers({required this.model});

  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  final OffersData offersData = new OffersData();

  @override
  void initState() {
    offersData.selectedType = offersData.types[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: DefaultAppBar(
          title: "اضافة عرض",
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
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                children: [
                  BuildAddCard(offersData: offersData,model: widget.model,),
                ],
              ),
            ),
            BuildAddAction(offersData: offersData),
          ],
        ),
      ),
    );
  }
}
