part of 'AddActivityWidgetsImports.dart';

class BuildStepperLine extends StatelessWidget {
  final int step;
  final GenericState<int> current;

  const BuildStepperLine({required this.step, required this.current});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 10,
      color: MyColors.greyWhite,
      alignment: Alignment.centerRight,
      child: Offstage(
        offstage: current is GenericInitialState,
        child: TweenAnimationBuilder(
          tween: current.data >= step? Tween<double>(begin: 0, end: 50) : Tween<double>(begin: 50, end: 0),
          duration: Duration(milliseconds: 800),
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
