part of 'ContactUsWidgetsImports.dart';

class BuildSocialItem extends StatelessWidget {
  final String image;

  const BuildSocialItem({required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.circle,
        ),
      ),
    );
  }
}
