import 'package:contacts_app/data/entity/users.dart';
import 'package:contacts_app/ui/cubit/home_cubit.dart';
import 'package:contacts_app/ui/details.dart';
import 'package:contacts_app/ui/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool Issearch = false;


  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().dowloandUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Issearch ?
        TextField(decoration: const InputDecoration(hintText: "Search"),
        onChanged: (searchResult){
          context.read<HomeCubit>().search(searchResult);
        },
        ) :
        const Text("Contacts"),
        actions: [
          Issearch ?
          IconButton(onPressed: (){
            setState(() {
              Issearch = false;
            });
            context.read<HomeCubit>().dowloandUser();
          }, icon: const Icon(Icons.clear)):
          IconButton(onPressed: (){
            setState(() {
              Issearch = true;
            });
          }, icon: const Icon(Icons.search))
        ],
      ),
      body:  BlocBuilder<HomeCubit,List<Users>>(
        builder: (context,userList){
          if(userList.isNotEmpty){
            return ListView.builder(
              itemCount: userList.length, //3
              itemBuilder: (context,index){//0,1,2
                var user = userList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage(user: user)))
                    .then((value) {
                      context.read<HomeCubit>().dowloandUser();
                    });
                  },
                  child: Card(
                    child:SizedBox( height: 100,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.user_name,style: const TextStyle(fontSize: 20),),
                                Text(user.user_no),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:Text("Delete user ${user.user_name}?"),
                                  action: SnackBarAction(
                                    label: "Yes",
                                    onPressed: (){
                                      context.read<HomeCubit>().delete(user.user_id);
                                    },
                                  ),
                                )
                            );
                            }, icon: const Icon(Icons.clear,color: Colors.black54,)),
                        ],
                      ),
                    )
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegistrationPage()))
              .then((value) {
            context.read<HomeCubit>().dowloandUser();
          });
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}
