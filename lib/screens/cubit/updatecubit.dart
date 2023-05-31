import 'package:bloc/bloc.dart';

class UpdateCubit extends Cubit<int>{

  UpdateCubit():super(0);

  void updatevalue(int value){

    emit(value);

  }




}