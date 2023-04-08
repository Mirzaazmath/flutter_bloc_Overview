import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/Cubit/internet_cubit.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Here we are using the Scaffold be
    return Scaffold(
      body: SafeArea(
        child: Center(
          child:  BlocConsumer<InternetCubit,InternetState>(
            // Bloc Lister is use to listen the changes  in background
            // We use lister to perform some task that are not Ui
            listener: (context, state){
              if(state == InternetState.Gain){
                ScaffoldMessenger.of(context).showSnackBar(
                  const   SnackBar(content: Text("Internet Connected"),
                  backgroundColor: Colors.green,
                  ));
              }else if (state == InternetState.Lost){
                ScaffoldMessenger.of(context).showSnackBar(
                    const   SnackBar(content: Text("Internet Lost"),
                      backgroundColor: Colors.red,

                    ));


              }else{

              }

            },
              // Bloc Builder is used to display the UI
            builder: (context,state){
              print(state);
              // if the Internet Is Connected
              if(state == InternetState.Gain){
                return const  Text("Connnected");
                // if the Internet Is Not  Connected
              }else if(state == InternetState.Lost){
                return const  Text(" Not Connnected");
                // It is the Initial State

              }else{
                return const  Text("Loading....");
              }
            }
           ),

      ),
    ));
  }
}
