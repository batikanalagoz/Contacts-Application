import 'package:contacts_app/ui/cubit/details_cubit.dart';
import 'package:contacts_app/ui/cubit/home_cubit.dart';
import 'package:contacts_app/ui/cubit/registration_cubit.dart';
import 'package:contacts_app/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>RegistrationCubit()),
        BlocProvider(create: (context)=> DetailsCubit()),
        BlocProvider(create: (context)=> HomeCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
