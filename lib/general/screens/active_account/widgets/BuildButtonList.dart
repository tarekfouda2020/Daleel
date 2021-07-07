part of 'ActiveAccountWidgetsImports.dart';

class BuildButtonList extends StatelessWidget {
  final ActiveAccountData activeAccountData;
  final String userId;

  const BuildButtonList({required this.activeAccountData,required this.userId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingButton(
          btnKey: activeAccountData.btnKey,
          title: tr(context,"continue"),
          onTap: () => activeAccountData.onActiveAccount(context, userId),
          color: MyColors.primary,
          margin: const EdgeInsets.symmetric(
            vertical: 30,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => AutoRouter.of(context).pop(),
              child: MyText(
                  title: "رجوع",
                  size: 13,
                  color: MyColors.primary,
                  decoration: TextDecoration.underline),
            ),
          ],
        ),
      ],
    );
  }
}
