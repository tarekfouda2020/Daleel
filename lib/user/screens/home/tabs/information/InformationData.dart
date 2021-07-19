part of 'InformationImports.dart';

class InformationData{

  final GenericBloc<UserModel?> userCubit = new GenericBloc(null);

  fetchData(BuildContext context,{bool refresh = true})async{
    var data = await UserRepository(context).getUserData(refresh);
    userCubit.onUpdateData(data);
  }

}