part of 'AssignmentImports.dart';

class AssignmentData{

  fetchData(BuildContext context){
    UserRepository(context).getSettings(true);
  }

}