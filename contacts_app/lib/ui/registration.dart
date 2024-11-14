import 'package:contacts_app/ui/cubit/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var tfUserName = TextEditingController();
  var tfUserNo = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfUserName, decoration: const InputDecoration(hintText: "User Name"),),
              TextField(controller: tfUserNo, decoration: const InputDecoration(hintText: "User Number"),),
              ElevatedButton(onPressed: (){
                context.read<RegistrationCubit>().save(tfUserName.text, tfUserNo.text);
              }, child: const Text("SAVE")),
            ],
          ),
        ),
      ),
    );
  }
}
