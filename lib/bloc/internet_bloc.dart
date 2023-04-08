import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/internet_event.dart';

import 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent,InernetState>{
  // here we are Initializing the connectivity package
  Connectivity _connectivity=Connectivity();

  // Here we are Creating the StreamSubscription to close the listen function when no longer needed
  StreamSubscription? connectivitySubscription;




  // super is for initialization the InternetBloc
  // When we Create a bloc we must have to provide it initial state
  // that's why we are giving the InternetBloc its initial state as InternetInitialState
  InternetBloc():super(InternetInitailState()){

    // Om is basically and contiously check the event

// Here we are providing InternetLostEvent as a type of event so it can check the changes
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));


    on<InternetGainEvent>((event, emit) => emit(InternetGainState()));

    // here we assigning the connectivitySubscription to onConnectivityChanged  function
    connectivitySubscription =  _connectivity.onConnectivityChanged.listen((result) {
      if(result==ConnectivityResult.mobile || result==ConnectivityResult.wifi){
        add(InternetGainEvent());
      }else{
        add(InternetLostEvent());
      }

    });
  }

  // here we are Overriding the close Function  of this bloc so when ever it close the task inside this block perform
  @override
  Future<void> close()async {

    // here we are close the listen connectivitySubscription
    // Note : if the listener not close at time it wll cause some performance issue
    // it's always better to close all kind of lister and controller when no longer needed
    connectivitySubscription?.cancel();
    return super.close();

  }
}