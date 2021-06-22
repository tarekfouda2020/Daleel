part of 'AddActivityWidgetsImports.dart';

class BuildStepperLine extends StatelessWidget {
  final int step;
  final int current;

  const BuildStepperLine({required this.step, required this.current});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 10,
      color: MyColors.greyWhite,
      alignment: Alignment.centerRight,
      child: Visibility(
        visible: current >= step,
        child: TweenAnimationBuilder(
          // curve: Curves.easeIn,
          tween: Tween<double>(begin: 0, end: 50),
          duration: Duration(seconds: 1),
          builder: (context, value, child) {
            return SizedBox(
              width: double.parse(value.toString()),
              child: Divider(
                color: MyColors.primary,
                thickness: 2,
                height: 10,
                indent: 0,
              ),
            );
          },
        ),
      ),
    );
  }
}
