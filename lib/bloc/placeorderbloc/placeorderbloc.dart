

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/placeorderbloc/orderstates.dart';


class PlaceOrderBloc extends Cubit<PlaceOrderStates>{
  PlaceOrderBloc():super(PlaceOrderInitailState());

  void placeOrder(){
    placeorderApi();
    emit(PlaceOrderLoadingState());

  }


  void  placeorderApi(){
    Timer( const Duration(seconds: 4), () {

      emit(PlaceOrderCompleteState());
    });

  }
}