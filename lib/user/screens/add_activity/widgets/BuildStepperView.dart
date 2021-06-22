part of 'AddActivityWidgetsImports.dart';

class BuildStepperView extends StatelessWidget {
  final AddActivityData activityData;

  const BuildStepperView({required this.activityData});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
      bloc: activityData.stepperCubit,
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildStepperCircle(step: 0, current: state.data,activityData: activityData,),
              BuildStepperLine(step: 1, current: state.data),
              BuildStepperCircle(step: 1, current: state.data,activityData: activityData,),
              BuildStepperLine(step: 2, current: state.data),
              BuildStepperCircle(step: 2, current: state.data,activityData: activityData,),
              BuildStepperLine(step: 3, current: state.data),
              BuildStepperCircle(step: 3, current: state.data,activityData: activityData,),
            ],
          ),
        );
      },
    );
  }
}

