import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/addtocartbloc/addtocartstates.dart';
import 'package:flutter_bloc_example/data/fruitsdata.dart';

class AddtoCartBLoc extends Cubit<AddtoCartStates>{
  AddtoCartBLoc():super(AddtoCartInitalState());

  void addtocartforfirsttime(Fruit item){
    item.units=1;
    addtocartlist.add(item);
    emit(AddtoCartUpdatedState());

  }
  void increament(Fruit item){
    item.units=item.units!+1;
    addtocartlist.add(item);
    emit(AddtoCartUpdatedState());
  }
  void ordered(){

    addtocartlist.clear();
    emit(AddtoCartUpdatedState());
  }

  void decrement(Fruit item){
    item.units=item.units!-1;
    if(item.units!<=0){
      addtocartlist.remove(item);
      emit(AddtoCartUpdatedState());
    }else{
      addtocartlist.add(item);

      emit(AddtoCartUpdatedState());
    }

  }





}