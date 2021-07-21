part of 'InformationImports.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  final InformationData informationData = new InformationData();

  @override
  void initState() {
    informationData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: DefaultAppBar(
          title: tr(context, "info"),
          back: false,
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: BlocBuilder<GenericBloc<UserModel?>, GenericState<UserModel?>>(
        bloc: informationData.userCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return ListView(
              children: [
                BuildInfoForm(
                  model: state.data!,
                  informationData: informationData,
                ),
                LoadingButton(
                  title: "حفظ التعديلات",
                  margin: EdgeInsets.all(20),
                  onTap: ()=> informationData.updateUserData(context),
                  btnKey: informationData.btnKey,
                ),
              ],
            );
          }
          return LoadingDialog.showLoadingView();
        },
      ),
    );
  }
}
