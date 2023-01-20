import 'package:diving_into_flutter_bloc/cubit/counter_cubit.dart';
import 'package:diving_into_flutter_bloc/cubit/counter_state.dart';
import 'package:diving_into_flutter_bloc/presentation/screens/screen2.dart';
import 'package:diving_into_flutter_bloc/presentation/screens/screen3.dart';
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

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  void dispose() {
    super.dispose();
    _counterCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        // home: const CounterScreen(),
        routes: {
          CounterScreen.routeName: (context) => BlocProvider.value(
                value: _counterCubit,
                child: const CounterScreen(),
              ),
          SecondScreen.routeName: (context) => BlocProvider.value(
                value: _counterCubit,
                child: const SecondScreen(),
              ),
          ThirdScreen.routeName: (context) => BlocProvider.value(
                value: _counterCubit,
                child: const ThirdScreen(),
              ),
        },
      ),
    );
  }
}
