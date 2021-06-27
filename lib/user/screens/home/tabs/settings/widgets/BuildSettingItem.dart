part of 'SettingWidgetImports.dart';

class BuildSettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? page;
  final Function()? onTap;

  const BuildSettingItem(
      {required this.icon,
      required this.title,
      this.page,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      closedColor: Colors.transparent,
      transitionDuration: Duration(milliseconds: 800),
      transitionType: ContainerTransitionType.fadeThrough,
      closedBuilder: (context, action) {
        return Column(
          children: [
            ListTile(
              onTap: onTap,
              title: MyText(title: title, color: MyColors.black, size: 12),
              leading: Icon(icon,size: 25,color: MyColors.primary,),
              trailing: Icon(Icons.arrow_forward_ios,size: 20,color: MyColors.black,),
            ),
            Divider(color: Colors.grey[300],thickness: .5,)
          ],
        );
      },
      openBuilder: (context, action) {
        return page??Container();
      },
    );
  }
}
