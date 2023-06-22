import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/counter_cubit.dart';
class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(

         /// here we are Using blocBuilder to rebuild only specific part of our UI
        /// it rebuild only when there is amy change in state
        /// BlocBuilder<CounterCubit, int>
        /// CounterCubit == The Cubit for Counter
        /// int === This is State so whenever the state changes it rebuild
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text('$state', style: textTheme.displayMedium);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            /// here we are call the increment method of CounterCubit to Update the State
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            /// here we are call the decrement method of CounterCubit to Update the State
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );

  }
}
