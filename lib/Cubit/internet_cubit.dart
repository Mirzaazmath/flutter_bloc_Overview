


import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Here we arw using enum instead of claases because it does not have the data
// and it also reduse the code
enum InternetState{Initial,Gain,Lost }

class InternetCubit extends Cubit<InternetState>{

//
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;


  InternetCubit():super(InternetState.Initial){
    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if(result==ConnectivityResult.wifi||result==ConnectivityResult.mobile ){
        emit(InternetState.Gain);
      }else{
        emit(InternetState.Lost);
      }

    });


  }

}