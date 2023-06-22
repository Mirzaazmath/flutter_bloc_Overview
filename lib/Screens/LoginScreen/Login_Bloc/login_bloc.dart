


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/Screens/LoginScreen/Login_Bloc/login_events.dart';
import 'package:flutter_bloc_example/Screens/LoginScreen/Login_Bloc/login_states.dart';

// class LoginBloc extends Bloc<LoginEvents,LoginStates>{
//   // This is the Intial State of the Bloc
//   LoginBloc():super(IntitialState()){
//
//     // This emit when LoginTextChangeEvent trigger
//     on<LoginTextChangeEvent>((event,emit){
//
//
//
//       if( RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(event.emailvalue)==false){
//         // Here we  are Emit the Error State
//         /// if the email is wrong then we emit the error state
//         emit(ErrorState("Please Enter a valid Email"));
//  } else if(event.passwordvalue.length<8){
//         /// if the password is wrong then we emit the error state
//         emit(ErrorState("Please Enter a valid Password"));
//       }else{
//         emit(ValidState());
//       }
//
//
//     });
//     // This emit when LoginSubmitEvent trigger
//     on<LoginSubmitEvent>((event,emit){
//       /// trigger when click on Submit button
//       emit(LoginLoadingState());
//
//     });
//
//   }
// }
class LoginBloc extends Bloc<LoginEvents,LoginStates>{
  // This is the Intial State of the Bloc
  LoginBloc():super(IntitialState()){

    // This emit when LoginTextChangeEvent trigger
    on<LoginTextChangeEvent>((event,emit){




      if(event.emailvalue==""){

        // Here we  are Emit the Error State
        /// if both are in empty state
        emit(ErrorState(""));

      }
      else if(RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(event.emailvalue)==false){

        /// if the email is wrong then we emit the error state

        emit(ErrorState("Please Enter a valid Email"));
      }
      else if(event.passwordvalue==""){
        emit(ErrorState(""));}
      else if(event.passwordvalue.length<5){
        /// if the password is wrong then we emit the error state
        emit(ErrorState("Please Enter a valid Password"));
      }
      else{
        emit(ValidState());
      }


    });
    // This emit when LoginSubmitEvent trigger
    // on<LoginSubmitEvent>((event,emit){
    //   /// trigger when click on Submit button
    //   emit(LoginLoadingState());
    //
    // });

  }
}