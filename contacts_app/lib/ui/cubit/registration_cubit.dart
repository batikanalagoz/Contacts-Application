import 'package:contacts_app/data/repo/usersdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationCubit extends Cubit<void>{
  RegistrationCubit():super(0);

  var krepo = UsersDaoRepository();

  Future<void> save(String user_name,String user_no)async{
    await krepo.save(user_name, user_no);
  }
}