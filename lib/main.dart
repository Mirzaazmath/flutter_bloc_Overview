import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/addtocartbloc/addtocartbloc.dart';
import 'package:flutter_bloc_example/bloc/categorybloc/cotegorybloc.dart';
import 'package:flutter_bloc_example/bloc/internetbloc/internetbloc.dart';
import 'package:flutter_bloc_example/bloc/navbarcubit.dart';
import 'package:flutter_bloc_example/bloc/placeorderbloc/placeorderbloc.dart';
import 'package:flutter_bloc_example/bloc/productBloc/productBloc.dart';
import 'package:flutter_bloc_example/bloc/searchbloc/searchbloc.dart';
import 'package:flutter_bloc_example/screens/homescreen.dart';
import 'package:flutter_bloc_example/screens/internetlostscreen.dart';

import 'bloc/internetbloc/internetstates.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(


      providers: [
        BlocProvider( create: (context)=>NavbarCubit(),),
        BlocProvider( create: (context)=>InternetBloc(),),
        BlocProvider( create: (context)=>ProductBloc(),),
        BlocProvider( create: (context)=>AddtoCartBLoc(),),
        BlocProvider( create: (context)=>CategoryCubit(),),
        BlocProvider( create: (context)=>PlaceOrderBloc(),),
        BlocProvider( create: (context)=>SearchBloc(),),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          indicatorColor:const  Color(0xffd4ced6),
          scaffoldBackgroundColor:const  Color(0xfffaf6f3),
            primaryColor:const  Color(0xffe3423e)
            //Colors.indigo
            //const  Color(0xffe3423e)
        ),
        home: BlocBuilder<InternetBloc,InernetState>(
            builder: (context,state){
              // if the Internet Is Connected
              if(state is InternetGainState){
                return HomeScreen();
                // if the Internet Is Not  Connected
              }else{
                return InternetLostScreen();
              }
            }

        ),
      ),
    );
  }
}
