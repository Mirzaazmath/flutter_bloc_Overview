

import 'package:flutter_bloc_example/Model/todomodel.dart';
import 'package:flutter_bloc_example/cubit/PostCubit/postStates.dart';
import 'package:bloc/bloc.dart';

import '../../Repo/httpsServices.dart';

class TodoCubit extends Cubit<TodoState>{
  TodoCubit():super(TodoLoadingState()){
    // This Function is called as soon as cubit Initialize
    fetchdata();

  }

  // Here we are creating the  TodoHttpServices class inatance
  TodoHttpServices _todoHttpServices=TodoHttpServices();


// This is cubit class function
  void fetchdata() async {
    try{
      // It calls the _todoHttpServices class api call and return data
     List<TodoModel>todos=await _todoHttpServices.fetchdata();

      // this trigger the loaded state
     emit(TodoLoadedState(todos));

    }catch(error){

      // this  trigger thw error statt
      emit(TodoErrorState(error.toString()));
    }


  }



}