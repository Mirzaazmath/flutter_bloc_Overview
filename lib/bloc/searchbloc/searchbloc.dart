
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/searchbloc/searchstates.dart';
import 'package:flutter_bloc_example/data/fruitsdata.dart';

class SearchBloc extends Cubit<SearchStates>{
  SearchBloc():super(SearchInitialState());

  void searchproduct(String letters){
    searchedlist.clear();
    if(letters==""){
      searchedlist.clear();
    }else{


    for(int i=0;i<fruitlist.length;i++){
      if(fruitlist[i].name.contains(letters)){
        searchedlist.add(fruitlist[i]);

      }else{}

    }}

    emit(SearchUpdatedState());

  }

}