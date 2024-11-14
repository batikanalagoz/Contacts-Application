import 'package:contacts_app/data/entity/users.dart';
import 'package:contacts_app/ui/cubit/details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatefulWidget {
  Users user;


  DetailsPage({required this.user});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var tfUserName = TextEditingController();
  var tfUserNo = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var user = widget.user;
    tfUserName.text = user.user_name;
    tfUserNo.text = user.user_no;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfUserName, decoration: const InputDecoration(hintText: "User Name"),),
              TextField(controller: tfUserNo, decoration: const InputDecoration(hintText: "User Number"),),
              ElevatedButton(onPressed: (){
                context.read<DetailsCubit>().update(widget.user.user_id, tfUserName.text, tfUserNo.text);
              }, child: const Text("UPDATE")),
            ],
          ),
        ),
      ),
    );
  }
}
