import 'package:flutter_bloc/flutter_bloc.dart';


/// This is the Counter Cubit Responsible for StateManagement
/// <int> == This Defines State
class CounterCubit extends Cubit<int>{

  /// As InitalState We Assign state == 0;
  CounterCubit():super(0);

  /// Increment Method
  void increment(){
    /// Here we Are emit the State
    /// this trigger state to Update
    emit(state+1);
  }

  /// Decrement Method
  void decrement(){
    /// Here we Are emit the State
    /// this trigger state to Update
    emit(state-1);
  }

}