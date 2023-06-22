import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';


/// Here We Created The Bloc Observer to Observe any Changes in states
/// and we print the changes
///  This Class is Extends From BlocObserver  from Bloc Package

class CounterBlocObserver extends BlocObserver{
  /// Constructor  of this Class
  const CounterBlocObserver();

  /// Here We are Overriding the onChange Method To Get All Changes
  @override

  /// as You can see here blacbase and Change are  type  of dynamic to get any type of bloc and changes
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    // TODO: implement onChange


    super.onChange(bloc, change);

    /// Here we are Printing the Observer if any changes  made
    ///

    debugPrint("${bloc.runtimeType} ${change}");
  }
}