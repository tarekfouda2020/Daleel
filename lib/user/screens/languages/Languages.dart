part of 'LanguagesImports.dart';

class Languages extends StatefulWidget {

  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  LanguagesData languagesData = new LanguagesData();

  @override
  void initState() {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    languagesData.langCubit.onUpdateData(lang);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: DefaultAppBar(
          title: tr(context,"lang"),
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: BlocBuilder<GenericBloc<String?>, GenericState<String?>>(
        bloc: languagesData.langCubit,
        builder: (context, state) {
          return ListView(
            children: [
              ListTile(
                title: MyText(
                  title: "العربية",
                  color: MyColors.black,
                  size: 12,
                ),
                leading: Image.asset(
                  Res.ksa,
                  width: 25,
                  height: 25,
                ),
                trailing: Radio<String>(
                  value: "ar",
                  groupValue: state.data,
                  onChanged: (value) => languagesData.setLanguage(context, value!),
                ),
              ),
              Divider(color: MyColors.grey),
              ListTile(
                title: MyText(
                  title: "English",
                  color: MyColors.black,
                  size: 12,
                ),
                leading: Image.asset(
                  Res.usa,
                  width: 25,
                  height: 25,
                ),
                trailing: Radio<String>(
                  value: "en",
                  groupValue: state.data,
                  onChanged: (value) => languagesData.setLanguage(context, value!),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
