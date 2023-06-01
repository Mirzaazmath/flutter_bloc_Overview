
import 'package:flutter_bloc/flutter_bloc.dart';


/// this  cubit is for bottom nav bar



class NavbarCubit extends Cubit<int>{
  NavbarCubit():super(0);
  void updatenavbar(int value){
    emit(value);
  }
}