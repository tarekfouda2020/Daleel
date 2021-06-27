part of 'ContactUsWidgetsImports.dart';

class BuildSocialItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Wrap(
        runSpacing: 10,
        spacing: 15,
        children: [
          BuildSocialItem(image: Res.facebook),
          BuildSocialItem(image: Res.instagram),
          BuildSocialItem(image: Res.telegram),
          BuildSocialItem(image: Res.twitter),
        ],
      ),
    );
  }
}

