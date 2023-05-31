import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/screens/cubit/updatecubit.dart';

import 'package:flutter_bloc_example/screens/homescreen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>UpdateCubit(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
