 import '../../Model/todomodel.dart';

abstract class TodoState{}

 // This is the Initail State of the our Cubit
 class TodoLoadingState extends TodoState{}

 // This is the state which have the data
 class TodoLoadedState extends TodoState{

 List<TodoModel> datalist;
 TodoLoadedState(this.datalist);
 }

 // This is Sate of Api error
 class TodoErrorState extends TodoState{
 String errormasssage;
 TodoErrorState(this.errormasssage);
 }