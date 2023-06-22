import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/Screens/LoginScreen/Login_Bloc/login_bloc.dart';
import 'package:flutter_bloc_example/Screens/LoginScreen/Login_Bloc/login_states.dart';

import 'Login_Bloc/login_events.dart';
class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
// This the Text Editing Controller
  TextEditingController _emailcontroller=TextEditingController();
  TextEditingController _passwordcontroller=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:const  EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
           const  SizedBox(height: 100,),
            const Center(child:   Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)),
            const  SizedBox(height: 80,),
          const   Text("Email",style: TextStyle(
              fontSize: 15,fontWeight: FontWeight.normal
            ),),
            Container(
              margin: const  EdgeInsets.only(top: 10),
              height: 50,
              alignment: Alignment.center,
              padding: const  EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade400)
              ),
              width: double.infinity,
              child: TextFormField(
                controller: _emailcontroller,
                onChanged: (value){
                  BlocProvider.of<LoginBloc>(context).add(LoginTextChangeEvent(_emailcontroller.text,_passwordcontroller.text));
                },
                decoration:const  InputDecoration(
                    border: InputBorder.none
                ),
              ),
            ),

          const  SizedBox(height: 20,),
          const   Text("Password",style: TextStyle(
                fontSize: 15,fontWeight: FontWeight.normal
            ),),
           Container(
             margin: const  EdgeInsets.only(top: 10),
             height: 50,
             alignment: Alignment.center,
             padding: const  EdgeInsets.symmetric(horizontal: 20),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               border: Border.all(color: Colors.grey.shade400)
             ),
             width: double.infinity,
             child: TextFormField(
               controller: _passwordcontroller,
               onChanged: (value){
                 BlocProvider.of<LoginBloc>(context).add(LoginTextChangeEvent(_emailcontroller.text,_passwordcontroller.text));
               },
               decoration: const InputDecoration(
                 border: InputBorder.none
               ),
             ),
           ),
            const  SizedBox(height: 30,),


          /// This Is For Error Message///

          BlocBuilder<LoginBloc,LoginStates>(builder: (context,state){

            if(state is ErrorState){
              return Text( state.errorMessage,style: const TextStyle(color: Colors.red),);
            }else{
              return Container();
            }
          }),

           const  SizedBox(height: 50,),
            // BlocBuilder<Bloc, State>
            BlocBuilder<LoginBloc,LoginStates>(builder: (context,state){
              if(state is LoginLoadingState){
                return const  Center(
                  child: CircularProgressIndicator(),
                );
              }else{


                return GestureDetector(
                  onTap: (state is ValidState)?(){
                    BlocProvider.of<LoginBloc>(context).add(LoginSubmitEvent(_emailcontroller.text, _passwordcontroller.text));
                  }:(){
                   print("Invalid");
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(20),
                        color: (state is ValidState)?Colors.blue: Colors.grey
                    ),
                    alignment: Alignment.center,
                    child: const Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),

                );}
            })



          ],
        ),
      ),

    );
  }
}
