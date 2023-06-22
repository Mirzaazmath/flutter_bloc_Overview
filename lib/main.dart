
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/bloc_observer/counterBloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/screens/counter_screen/counter_screen.dart';

void main(){

  /// this is a Global Bloc Observer for all bloc
  /// this helps in debuging easy

 Bloc.observer =  CounterBlocObserver();
runApp( MyApp());
}
/// Here We are Using different Approach for Material App class it also works fine
class MyApp extends MaterialApp{
  const MyApp({super.key}):super(home:const  CounterScreen());
  @override
  // TODO: implement theme
  ThemeData? get theme => ThemeData(
    scaffoldBackgroundColor: Colors.white,
  );
}