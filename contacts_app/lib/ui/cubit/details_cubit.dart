import 'package:contacts_app/data/repo/usersdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit{
  DetailsCubit():super(0);

  var krepo = UsersDaoRepository();

  Future<void> update(int user_id ,String user_name,String user_no)async{
    await krepo.update(user_id, user_name, user_no);
  }

}