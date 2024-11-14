import 'package:contacts_app/data/entity/users.dart';
import 'package:contacts_app/data/repo/usersdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<List<Users>>{
  HomeCubit():super(<Users>[]);

  var krepo = UsersDaoRepository();

  Future<void>dowloandUser()async{
    var list = await krepo.dowloandUser();
    emit(list);
  }

  Future<void>search(String searchWord) async{
    var list = await krepo.search(searchWord);
    emit(list);
  }

  Future<void>delete(int user_id)async{
    await krepo.delete(user_id);
    await dowloandUser();
  }


}