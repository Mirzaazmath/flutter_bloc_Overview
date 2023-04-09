import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/Cubit/countercubit.dart';

import 'Screens/homepage.dart';
void main(){
runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CounterCubit(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
