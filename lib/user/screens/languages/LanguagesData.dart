part of 'LanguagesImports.dart';


class LanguagesData{

  final GenericBloc<String?> langCubit = new GenericBloc(null);

  setLanguage(BuildContext context,String lang)async{
    langCubit.onUpdateData(lang.toString());
    Utils.changeLanguage(lang.toString(), context);
    var user = context.read<UserCubit>();
    user.state.model.lang=lang;
    user.onUpdateUserData(user.state.model);
  }



}