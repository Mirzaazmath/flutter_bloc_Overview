import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/Cubit/internet_cubit.dart';


import 'Screen/homepage.dart';

// Every Program Starts from Main
void main(){
  // After main, run App executed and Make what ever class we enter in runApp  root of the project
  runApp(MyApp());
}
// This is the First Class and root class
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Here we are Using the Material App because we are following the material UI Design
   // Same as provider we also have to provide our bloc to the class
    // here we are provide because we are going to use it in entire application
    return BlocProvider(
      create: (context)=>InternetCubit(),
      child: const  MaterialApp(
        // Whatever we assign the class it goes to that class first
        home: Homepage(),

      ),
    );
  }
}

