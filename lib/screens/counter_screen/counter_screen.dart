import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/blocs/counter_cubit.dart';

import 'counter_view.dart';

/// This is a Counter Screen
class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     /// Here we are using bloc provider  to pass the CounterCubit to its subtree
    return BlocProvider(
      create: (context)=>CounterCubit(),
      /// here is the UI Section
      child: CounterView(),

    );
  }
}
