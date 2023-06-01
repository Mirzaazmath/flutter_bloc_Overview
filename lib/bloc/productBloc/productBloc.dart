

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_example/bloc/productBloc/productstates.dart';

class ProductBloc extends Cubit<ProductStates>{
  ProductBloc():super(ProductLoadingState()){
    fetchdataApi();
  }



 void  fetchdataApi(){
   Timer( const Duration(seconds: 4), () {
     emit(ProductLoadedState());
   });

  }

}

