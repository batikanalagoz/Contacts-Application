import 'package:contacts_app/data/entity/users.dart';
import 'package:contacts_app/sqlite/database_assistant.dart';

class UsersDaoRepository{
  //REGISTRATION
  Future<void> save(String user_name,String user_no)async{
    var db = await DatabaseAssistant.databaseAccess();
    var newUser = Map<String,dynamic>();
    newUser["user_name"] = user_name;
    newUser["user_no"] =user_no;
    await db.insert("users", newUser);
  }
  //DETAILS
  Future<void> update(int user_id ,String user_name,String user_no)async{
    var db = await DatabaseAssistant.databaseAccess();
    var updatedPerson = Map<String,dynamic>();
    updatedPerson["user_name"] = user_name;
    updatedPerson["user_no"] =user_no;
    await db.update("users", updatedPerson,where: "user_id = ?",whereArgs: [user_id]);
  }
  //HOME
  Future<void>delete(int user_id)async{
    var db = await DatabaseAssistant.databaseAccess();
    await db.delete("users",where: "user_id = ?",whereArgs: [user_id]);
  }

  Future<List<Users>>dowloandUser()async{
    var db = await DatabaseAssistant.databaseAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM users");

    return List.generate(maps.length, (index){
      var line = maps[index];
      return Users(user_id: line["user_id"], user_name: line["user_name"], user_no: line["user_no"]);
    });
  }

  Future<List<Users>>search(String searchWord) async{
    var db = await DatabaseAssistant.databaseAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM users WHERE user_name like '%$searchWord%'");

    return List.generate(maps.length, (index){
      var line = maps[index];
      return Users(user_id: line["user_id"], user_name: line["user_name"], user_no: line["user_no"]);
    });
  }


}