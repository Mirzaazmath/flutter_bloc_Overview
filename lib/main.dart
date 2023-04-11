import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/cubit/PostCubit/todocubit.dart';

import 'UI_Screen/homeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>TodoCubit(),
      child:

   MaterialApp(
      home: HomeScreen(),
      ));
  }
}
