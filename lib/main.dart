import 'package:diving_into_flutter_bloc/cubit/counter_cubit.dart';
import 'package:diving_into_flutter_bloc/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit_counter.dart';
import 'home_screen.dart';

void main() {
  const CounterState counterState1 = CounterState(
    counterValue: 1,
    wasIncremented: true,
  );

  const CounterState counterState2 = CounterState(
    counterValue: 1,
    wasIncremented: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: const MaterialApp(
        home: CounterScreen(),
        routes: {

        },
      ),
    );
  }
}
