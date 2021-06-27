part of 'ContactUsImports.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final ContactUsData contactUsData = new ContactUsData();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: DefaultAppBar(
          title: "تواصل معنا",
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              children: [
                BuildContactForm(
                  contactUsData: contactUsData,
                ),
              ],
            ),
          ),
          BuildContactSocial(
            contactUsData: contactUsData,
          ),
        ],
      ),
    );
  }
}
